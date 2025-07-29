# Lovable + Supabase Integration Guide

## Setting Up Supabase Backend

### 1. Database Schema Setup

```sql
-- Run this in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Clients table
CREATE TABLE clients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id),
  name TEXT NOT NULL,
  industry TEXT,
  website TEXT,
  current_show_rate DECIMAL(3,2),
  target_show_rate DECIMAL(3,2),
  status TEXT DEFAULT 'collecting_data',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Transcripts table
CREATE TABLE transcripts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id UUID REFERENCES clients(id) ON DELETE CASCADE,
  filename TEXT,
  content TEXT NOT NULL,
  metadata JSONB DEFAULT '{}',
  processed BOOLEAN DEFAULT FALSE,
  batch_number INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Analysis results
CREATE TABLE analysis_results (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id UUID REFERENCES clients(id) ON DELETE CASCADE,
  batch_ids UUID[],
  segment_distribution JSONB,
  key_patterns JSONB,
  completed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Generated content
CREATE TABLE content_versions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id UUID REFERENCES clients(id) ON DELETE CASCADE,
  awareness_level TEXT CHECK (awareness_level IN ('problem', 'solution', 'product')),
  content_type TEXT CHECK (content_type IN ('email', 'sms', 'gamma')),
  content TEXT,
  subject_lines TEXT[],
  version INTEGER DEFAULT 1,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Performance metrics
CREATE TABLE performance_metrics (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  content_version_id UUID REFERENCES content_versions(id) ON DELETE CASCADE,
  date DATE NOT NULL,
  show_rate DECIMAL(3,2),
  open_rate DECIMAL(3,2),
  click_rate DECIMAL(3,2),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE transcripts ENABLE ROW LEVEL SECURITY;
ALTER TABLE analysis_results ENABLE ROW LEVEL SECURITY;
ALTER TABLE content_versions ENABLE ROW LEVEL SECURITY;
ALTER TABLE performance_metrics ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Users can view own clients" ON clients
  FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can view own transcripts" ON transcripts
  FOR ALL USING (
    client_id IN (
      SELECT id FROM clients WHERE user_id = auth.uid()
    )
  );

-- Create indexes for performance
CREATE INDEX idx_transcripts_client_id ON transcripts(client_id);
CREATE INDEX idx_content_client_awareness ON content_versions(client_id, awareness_level);
CREATE INDEX idx_metrics_date ON performance_metrics(date);

-- Create updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_clients_updated_at 
  BEFORE UPDATE ON clients
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
```

### 2. Supabase Edge Functions

Create edge function for triggering analysis:

```typescript
// supabase/functions/trigger-analysis/index.ts
import { serve } from "https://deno.land/std@0.131.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  const { clientId } = await req.json()
  
  // Initialize Supabase client
  const supabaseClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  )
  
  // Get client transcripts
  const { data: transcripts, error } = await supabaseClient
    .from('transcripts')
    .select('*')
    .eq('client_id', clientId)
    .eq('processed', false)
    .order('created_at')
  
  if (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 400,
      headers: { 'Content-Type': 'application/json' }
    })
  }
  
  // Group into batches of 5
  const batches = []
  for (let i = 0; i < transcripts.length; i += 5) {
    batches.push(transcripts.slice(i, i + 5))
  }
  
  // Send to Cursor webhook (replace with your actual webhook)
  const cursorWebhook = Deno.env.get('CURSOR_WEBHOOK_URL')
  
  for (const [index, batch] of batches.entries()) {
    await fetch(cursorWebhook, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        clientId,
        batchNumber: index + 1,
        transcripts: batch
      })
    })
    
    // Mark as processed
    const transcriptIds = batch.map(t => t.id)
    await supabaseClient
      .from('transcripts')
      .update({ processed: true, batch_number: index + 1 })
      .in('id', transcriptIds)
  }
  
  return new Response(JSON.stringify({ 
    success: true, 
    batchCount: batches.length 
  }), {
    headers: { 'Content-Type': 'application/json' }
  })
})
```

### 3. Lovable Frontend Integration

Update your Lovable app with Supabase client:

```javascript
// src/lib/supabase.js
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// Helper functions
export const clientsApi = {
  async getAll() {
    const { data, error } = await supabase
      .from('clients')
      .select('*')
      .order('created_at', { ascending: false })
    
    if (error) throw error
    return data
  },
  
  async create(client) {
    const { data, error } = await supabase
      .from('clients')
      .insert([client])
      .select()
      .single()
    
    if (error) throw error
    return data
  },
  
  async update(id, updates) {
    const { data, error } = await supabase
      .from('clients')
      .update(updates)
      .eq('id', id)
      .select()
      .single()
    
    if (error) throw error
    return data
  }
}

export const transcriptsApi = {
  async uploadBatch(clientId, files) {
    const transcripts = []
    
    for (const file of files) {
      const content = await file.text()
      
      transcripts.push({
        client_id: clientId,
        filename: file.name,
        content,
        metadata: extractMetadata(content)
      })
    }
    
    const { data, error } = await supabase
      .from('transcripts')
      .insert(transcripts)
      .select()
    
    if (error) throw error
    return data
  },
  
  async triggerAnalysis(clientId) {
    const { data, error } = await supabase.functions.invoke('trigger-analysis', {
      body: { clientId }
    })
    
    if (error) throw error
    return data
  }
}

// Metadata extraction
function extractMetadata(content) {
  const metadata = {}
  
  // Extract date
  const dateMatch = content.match(/Date:\s*(\d{4}-\d{2}-\d{2})/)
  if (dateMatch) metadata.date = dateMatch[1]
  
  // Extract outcome
  const outcomePatterns = {
    'closed_won': /closed|won|signed|deal/i,
    'lost': /lost|chose competitor|not interested/i,
    'no_show': /no show|didn't show|missed/i
  }
  
  for (const [outcome, pattern] of Object.entries(outcomePatterns)) {
    if (pattern.test(content)) {
      metadata.outcome = outcome
      break
    }
  }
  
  return metadata
}
```

### 4. Real-time Subscriptions

Add real-time updates to your Lovable components:

```javascript
// src/hooks/useRealtimeClient.js
import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'

export function useRealtimeClient(clientId) {
  const [client, setClient] = useState(null)
  const [analysisProgress, setAnalysisProgress] = useState(0)
  
  useEffect(() => {
    // Initial fetch
    supabase
      .from('clients')
      .select('*')
      .eq('id', clientId)
      .single()
      .then(({ data }) => setClient(data))
    
    // Subscribe to changes
    const subscription = supabase
      .channel(`client:${clientId}`)
      .on('postgres_changes', 
        { 
          event: 'UPDATE', 
          schema: 'public', 
          table: 'clients',
          filter: `id=eq.${clientId}`
        }, 
        (payload) => {
          setClient(payload.new)
        }
      )
      .on('postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'analysis_results',
          filter: `client_id=eq.${clientId}`
        },
        (payload) => {
          if (payload.eventType === 'INSERT') {
            setAnalysisProgress(prev => prev + 20)
          }
        }
      )
      .subscribe()
    
    return () => {
      subscription.unsubscribe()
    }
  }, [clientId])
  
  return { client, analysisProgress }
}
```

### 5. Authentication Setup

Add authentication to your Lovable app:

```javascript
// src/contexts/AuthContext.jsx
import { createContext, useContext, useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'

const AuthContext = createContext({})

export const useAuth = () => useContext(AuthContext)

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null)
  const [loading, setLoading] = useState(true)
  
  useEffect(() => {
    // Check active session
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null)
      setLoading(false)
    })
    
    // Listen for changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        setUser(session?.user ?? null)
      }
    )
    
    return () => subscription.unsubscribe()
  }, [])
  
  const signIn = async (email, password) => {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    })
    if (error) throw error
    return data
  }
  
  const signUp = async (email, password) => {
    const { data, error } = await supabase.auth.signUp({
      email,
      password
    })
    if (error) throw error
    return data
  }
  
  const signOut = async () => {
    const { error } = await supabase.auth.signOut()
    if (error) throw error
  }
  
  return (
    <AuthContext.Provider value={{
      user,
      loading,
      signIn,
      signUp,
      signOut
    }}>
      {children}
    </AuthContext.Provider>
  )
}
```

### 6. Environment Variables

Create `.env` in your Lovable project:

```bash
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key
```

### 7. Deploy Edge Functions

```bash
# Deploy the trigger-analysis function
supabase functions deploy trigger-analysis

# Set secrets
supabase secrets set CURSOR_WEBHOOK_URL=https://your-cursor-webhook.com
```

## Complete Integration Flow

1. **User uploads transcripts** → Lovable UI
2. **Files stored in Supabase** → `transcripts` table
3. **User clicks "Analyze"** → Calls edge function
4. **Edge function triggers Cursor** → Via webhook
5. **Cursor processes batches** → Returns results
6. **Results stored in Supabase** → `analysis_results` table
7. **Real-time updates** → UI updates automatically
8. **Content generated** → Stored with versions
9. **Performance tracked** → Metrics table updated daily

This gives you a complete, production-ready system with:
- Secure authentication
- Real-time updates
- Scalable backend
- Version control
- Performance tracking
- Learning system ready