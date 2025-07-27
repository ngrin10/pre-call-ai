-- ScaleStream Database Schema

-- Clients table
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(255) UNIQUE NOT NULL, -- e.g., "acme-corp"
    company_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50),
    status VARCHAR(50) DEFAULT 'onboarding', -- onboarding, analyzing, implementing, live, optimizing
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Client configuration (maps to client-config.yaml)
CREATE TABLE client_configs (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    business_description TEXT,
    solution_category VARCHAR(255),
    target_audience TEXT,
    target_descriptor VARCHAR(100),
    current_stats TEXT,
    volume_metrics TEXT,
    pricing_info TEXT,
    sales_process TEXT,
    total_transcripts INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Onboarding form responses
CREATE TABLE onboarding_forms (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    -- Performance metrics
    current_show_rate DECIMAL(5,2),
    current_close_rate DECIMAL(5,2),
    average_deal_value DECIMAL(10,2),
    no_show_rate DECIMAL(5,2),
    monthly_call_volume INTEGER,
    
    -- Business info
    niche TEXT,
    avatar TEXT,
    primary_goals TEXT,
    secondary_goals TEXT,
    primary_complaints TEXT,
    secondary_complaints TEXT,
    ultimate_fear TEXT,
    
    -- Competition
    competitors JSONB, -- Array of competitor objects
    unique_mechanism TEXT,
    
    -- Tech stack
    tech_stack JSONB, -- Object with all tools
    
    -- Goals
    target_show_rate DECIMAL(5,2),
    revenue_goal DECIMAL(10,2),
    
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Awareness stages configuration
CREATE TABLE awareness_stages (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    stage_name VARCHAR(50), -- problem_aware, solution_aware, product_aware
    indicators JSONB, -- Array of indicators
    pain_points JSONB, -- Array of pain points
    search_terms TEXT,
    example_descriptor TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transcript batches
CREATE TABLE transcript_batches (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    batch_number INTEGER,
    transcript_count INTEGER DEFAULT 5,
    file_path VARCHAR(500),
    status VARCHAR(50) DEFAULT 'pending', -- pending, analyzing, completed
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    analyzed_at TIMESTAMP
);

-- Analysis results
CREATE TABLE analysis_results (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    batch_id INTEGER REFERENCES transcript_batches(id) ON DELETE CASCADE,
    awareness_distribution JSONB, -- {problem: 40, solution: 35, product: 25}
    key_findings TEXT,
    segment_profiles JSONB,
    language_patterns JSONB,
    objection_map JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Generated content
CREATE TABLE generated_content (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    awareness_level VARCHAR(50), -- problem-aware, solution-aware, product-aware
    content_type VARCHAR(50), -- email, sms, subject_line
    content_data JSONB, -- Stores sequences, templates, etc.
    status VARCHAR(50) DEFAULT 'draft', -- draft, approved, live
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    approved_at TIMESTAMP
);

-- Performance metrics
CREATE TABLE performance_metrics (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    metric_date DATE,
    show_rate DECIMAL(5,2),
    close_rate DECIMAL(5,2),
    email_open_rate DECIMAL(5,2),
    email_click_rate DECIMAL(5,2),
    sms_response_rate DECIMAL(5,2),
    calls_booked INTEGER,
    calls_showed INTEGER,
    deals_closed INTEGER,
    revenue_generated DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Audit log for tracking all actions
CREATE TABLE audit_logs (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE,
    user_email VARCHAR(255),
    action VARCHAR(100),
    details JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for performance
CREATE INDEX idx_clients_status ON clients(status);
CREATE INDEX idx_clients_slug ON clients(slug);
CREATE INDEX idx_transcript_batches_status ON transcript_batches(status);
CREATE INDEX idx_generated_content_status ON generated_content(status);
CREATE INDEX idx_performance_metrics_date ON performance_metrics(client_id, metric_date);