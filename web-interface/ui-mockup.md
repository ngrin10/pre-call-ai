# 🎨 ScaleStream UI/UX Design

## Dashboard Layout

```
┌─────────────────────────────────────────────────────────────┐
│ ScaleStream                           [User] [Settings] [?]  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📊 Client Overview                    [+ New Client]       │
│                                                             │
│  ┌─────────────┬─────────────┬─────────────┬────────────┐ │
│  │ Acme Corp   │ Tech Pro    │ Sales Inc   │ Beta LLC   │ │
│  │ 🟡 Analyzing │ 🟢 Live     │ 🔵 Onboard  │ 🟢 Live    │ │
│  │ Show: 45%    │ Show: 67%   │ Show: --    │ Show: 72%  │ │
│  │ ↑ +12%       │ ↑ +23%      │ Baseline    │ ↑ +18%     │ │
│  └─────────────┴─────────────┴─────────────┴────────────┘ │
│                                                             │
│  📈 System Performance                                      │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ Avg Show Rate Improvement: +19.2%                    │  │
│  │ Total Revenue Impact: $247,000/mo                    │  │
│  │ Active Campaigns: 12                                  │  │
│  └─────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## Onboarding Wizard Flow

### Step 1: Basic Information
```
┌─────────────────────────────────────────────────────────────┐
│ New Client Onboarding                              Step 1/6  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Let's start with the basics                               │
│                                                             │
│  Company Name *                                             │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ Acme Corporation                                     │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  Contact Name *                                             │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ John Smith                                           │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  Email *                                                    │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ john@acmecorp.com                                    │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  [Back]                                    [Save & Next →]  │
└─────────────────────────────────────────────────────────────┘
```

### Step 2: Performance Metrics
```
┌─────────────────────────────────────────────────────────────┐
│ Performance Baseline                               Step 2/6  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📊 Current Metrics (This helps us track improvement)       │
│                                                             │
│  Show Rate              Close Rate                          │
│  ┌──────────┐ %        ┌──────────┐ %                     │
│  │    45    │          │    22    │                        │
│  └──────────┘          └──────────┘                        │
│                                                             │
│  Avg Deal Value         Monthly Calls                       │
│  $ ┌──────────┐         ┌──────────┐                       │
│    │   5,000  │         │    80    │                       │
│    └──────────┘         └──────────┘                       │
│                                                             │
│  📈 Target Goals                                            │
│                                                             │
│  Target Show Rate: [65]% (+20%)                            │
│  Expected Revenue Impact: $64,000/mo                        │
│                                                             │
│  [← Back]                                  [Save & Next →]  │
└─────────────────────────────────────────────────────────────┘
```

### Step 3: Business Context
```
┌─────────────────────────────────────────────────────────────┐
│ Business Context                                   Step 3/6  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  What do you sell? (One clear sentence)                    │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ We help SaaS companies reduce churn through         │  │
│  │ personalized customer success programs               │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  Who is your ideal customer?                               │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ B2B SaaS companies with 50-500 employees,          │  │
│  │ $5M-$50M ARR, experiencing 10%+ annual churn        │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  Top 3 Competitors:                                        │
│  1. ┌───────────────────────┐ 2. ┌───────────────────┐   │
│     │ ChurnZero            │    │ Gainsight         │    │
│     └───────────────────────┘    └───────────────────┘    │
│                                                             │
│  3. ┌───────────────────────┐                              │
│     │ Totango              │                               │
│     └───────────────────────┘                              │
│                                                             │
│  [← Back]                                  [Save & Next →]  │
└─────────────────────────────────────────────────────────────┘
```

## Analysis Dashboard

```
┌─────────────────────────────────────────────────────────────┐
│ Acme Corp - Analysis Progress                    [Back →]   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📊 Transcript Analysis                                     │
│                                                             │
│  ┌────────────────┬──────────┬─────────────────────────┐  │
│  │ Batch 1 (1-5)  │ ✅ Done  │ [View Results]          │  │
│  ├────────────────┼──────────┼─────────────────────────┤  │
│  │ Batch 2 (6-10) │ 🔄 75%   │ Analyzing objections... │  │
│  ├────────────────┼──────────┼─────────────────────────┤  │
│  │ Batch 3 (11-15)│ ⏳ Queue │ Waiting...              │  │
│  └────────────────┴──────────┴─────────────────────────┘  │
│                                                             │
│  📈 Awareness Distribution (Partial)                        │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ Problem Aware:  ████████████░░░░  45%               │  │
│  │ Solution Aware: ████████░░░░░░░░  32%               │  │
│  │ Product Aware:  █████░░░░░░░░░░░  23%               │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  💡 Key Insights (So Far)                                   │
│  • Primary objection: "We already have a CS team"          │
│  • Common pain: "Can't predict which customers will churn" │
│  • Trigger phrase: "proactive customer success"            │
│                                                             │
│  [Pause Analysis]                    [Generate Content →]   │
└─────────────────────────────────────────────────────────────┘
```

## Content Generation Interface

```
┌─────────────────────────────────────────────────────────────┐
│ Content Generator - Problem Aware (45%)          [Back →]   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📧 Email Sequence (5 emails)              [AI Assist 🤖]  │
│                                                             │
│  Email 1: The Hidden Churn Problem                         │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ Subject: The $2M mistake 73% of SaaS companies make  │  │
│  │                                                       │  │
│  │ Hi {{FirstName}},                                     │  │
│  │                                                       │  │
│  │ Quick question - do you know which of your           │  │
│  │ customers will cancel in the next 90 days?           │  │
│  │                                                       │  │
│  │ If you're like most SaaS leaders, the answer is...   │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  [+ Add Email]  [Preview]  [Save Draft]  [Test Send]       │
│                                                             │
│  💬 SMS Flow (3 messages)                                   │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ Hey {{FirstName}}, noticed you signed up to learn    │  │
│  │ about reducing churn. Still interested? I have a     │  │
│  │ 2-min case study that shows how Similar Co went      │  │
│  │ from 15% to 7% churn. Want me to send it?            │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  [Generate All]                           [Deploy to GHL]   │
└─────────────────────────────────────────────────────────────┘
```

## API Endpoints Design

```javascript
// Client Management
POST   /api/clients                 // Create new client
GET    /api/clients                 // List all clients
GET    /api/clients/:slug           // Get client details
PUT    /api/clients/:slug           // Update client
DELETE /api/clients/:slug           // Archive client

// Onboarding
POST   /api/clients/:slug/onboarding     // Save form data
GET    /api/clients/:slug/onboarding     // Get form data

// Transcripts
POST   /api/clients/:slug/transcripts    // Upload transcripts
GET    /api/clients/:slug/transcripts    // List batches
POST   /api/clients/:slug/analyze        // Trigger analysis

// Analysis
GET    /api/clients/:slug/analysis       // Get results
GET    /api/clients/:slug/analysis/progress // Real-time status

// Content
POST   /api/clients/:slug/content        // Generate content
GET    /api/clients/:slug/content        // Get all content
PUT    /api/clients/:slug/content/:id    // Update content
POST   /api/clients/:slug/content/deploy // Deploy to platform

// Metrics
GET    /api/clients/:slug/metrics        // Performance data
POST   /api/clients/:slug/metrics        // Log new metrics
```

## Implementation Priority

### Week 1: Core Foundation
1. Database setup with Prisma
2. Next.js project with TypeScript
3. Basic client CRUD
4. Onboarding form (all fields)
5. File upload system

### Week 2: Analysis Integration
1. Connect to bash scripts via child_process
2. Real-time progress tracking
3. Results display
4. Basic content templates

### Week 3: Polish & Deploy
1. Authentication system
2. Error handling
3. Data validation
4. Production deployment
5. User training

This approach gives you a professional interface while leveraging all the existing automation scripts you've built. The key is making it feel seamless while handling all the complexity behind the scenes.