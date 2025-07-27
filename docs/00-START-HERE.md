# 🚀 SCALESTREAM SYSTEM - START HERE

## What This System Does
The ScaleStream Pre-Call System™ analyzes sales transcripts to create hyper-personalized nurture sequences based on prospect awareness levels, improving show rates by 20-30%.

## Quick Start (2 Minutes)
```bash
# 1. Start new client
./automation/quick-commands.sh new [client-name]

# 2. Edit client brief
nano ./data/clients/[client-name]/client-brief.md

# 3. Add transcripts & run analysis
./automation/quick-commands.sh analyze [client-name]

# 4. Generate content
./automation/quick-commands.sh content [client-name] problem-aware
```

## Pre-Requirements ✅
Before starting ANY client:
- [ ] 15+ sales call transcripts available
- [ ] Business running 12+ months
- [ ] Booking 10+ calls/month minimum
- [ ] Clear offer and pricing structure

**🚨 No transcripts = Stop here. This system won't work.**

## System Overview

### The Core Innovation
We segment prospects by **awareness level** and create different journeys:
```
60% PROBLEM AWARE → Need education about opportunity
30% SOLUTION AWARE → Need differentiation and proof
8% PRODUCT AWARE → Need urgency and risk reversal
2% CONVICTED → Need logistics only
```

**Learn more**: See `/sops/v3-methodology.md` for the complete awareness spectrum framework.

### The Process Flow
```
1. ANALYZE transcripts → Find awareness patterns
2. SEGMENT prospects → Create buyer profiles  
3. GENERATE content → Awareness-specific sequences
4. AUTOMATE delivery → GHL + SendBlue + Zapier
5. OPTIMIZE results → Track and improve
```

## 🔴 Critical Decision: B2C vs B2B

This choice in `client-brief.md` changes EVERYTHING:

**B2C (Selling to Public)**
- Emotional transformation focus
- Price: $997-$5K
- Volume: 100-1000+ clients
- Templates: `/sops/core-workflow/B2C_*.pdf`

**B2B (Selling to Executives)**
- ROI and time-saving focus
- Price: $10K-$100K+
- Volume: 10-50 clients
- Templates: Need to be added to `/sops/core-workflow/`

## Directory Structure
```
/scalestream-system/
├── /automation/         # CLI commands
├── /prompts/           # Analysis prompts (01-05)
├── /sops/              # SOPs and templates
│   ├── /core-workflow/ # Master SOP + B2C/B2B templates
│   ├── /onboarding/    # Client onboarding
│   └── /v3-methodology.md # Awareness spectrum framework
├── /templates/         # Content templates
│   ├── /awareness-segments.md # Templates for each awareness level
│   └── /va-instructions-email.md # VA collection template
├── /examples/          # High-converting examples
├── /0-INBOX/           # New client onboarding starts here
└── /data/clients/      # Client workspaces
```

## Step-by-Step Workflow

### Phase 1: Setup & Analysis (Days 1-5)
1. Run `./quick new [client]` OR use `/0-INBOX/new-client-template/`
2. Complete strategic onboarding call (90 min)
3. Collect 15-20 transcripts using:
   - VA: Use `/templates/va-instructions-email.md` + `/sops/va-transcript-collection.md`
   - Direct: Organize in batches of 5 (or 10 for larger projects)
4. Run forensic analysis with `/prompts/01-forensic-analysis.md`
5. Synthesize segments with `/prompts/02-segment-synthesis.md`

### Phase 2: Content Creation (Days 6-10)
1. Generate content with `./quick content [client] [awareness]`
2. Uses `/prompts/03-content-generation.md`
3. Applies templates from `/templates/awareness-segments.md`
4. References B2C or B2B templates from `/sops/core-workflow/`
5. Creates emails, SMS, and trust assets per segment

### Phase 3: Implementation (Days 11-15)
1. Set up GoHighLevel workflows
2. Configure SendBlue SMS
3. Connect via Zapier
4. Test all sequences

### Phase 4: Launch & Optimize (Days 16-20+)
1. Run quality checks
2. Train client team
3. Launch with small test
4. Monitor and optimize

## Command Reference
```bash
./quick new [client]              # Create workspace
./quick analyze [client]          # Process transcripts
./quick content [client] [level]  # Generate content
./quick check [client]            # Quality gates
./quick status [client]           # View progress
```

Awareness levels: `problem-aware`, `solution-aware`, `product-aware`

## Key Files You'll Use

### For Methodology:
- `/sops/v3-methodology.md` - V3.0 awareness spectrum framework
- `/templates/awareness-segments.md` - Content templates by awareness level

### For Analysis:
- `/prompts/01-forensic-analysis.md` - Transcript analysis
- `/prompts/02-segment-synthesis.md` - Combine findings
- `/sops/va-transcript-collection.md` - VA collection process

### For Content:
- `/prompts/03-content-generation.md` - Create sequences
- `/templates/awareness-segments.md` - Awareness-specific templates
- `/sops/core-workflow/B2C_*.pdf` - B2C email templates
- `/sops/core-workflow/WSI*.pdf` - Strategy guides

### For Reference:
- `/sops/core-workflow/THE SCALESTREAM PRE-CALL SYSTEM™ SOP V3.0` - Master guide
- `/examples/winning/` - High-converting examples

## Common Issues

**"Client directory not found"**
→ Run `./quick new [client]` first OR use `/0-INBOX/` template

**"No transcripts found"**
→ Add to `/data/clients/[client]/transcripts/batch-1.md`
→ Or use VA with `/templates/va-instructions-email.md`

**"Segments not validated"**
→ Complete forensic analysis first
→ Check against V3.0 methodology standards

## Success Metrics
Target improvements:
- Show rate: +20-30%
- Awareness progression: 60% move up 1+ levels
- Engagement: 40%+ email opens
- ROI: Measurable within 30 days

## Next Steps
1. Choose: Use `./quick new [client]` OR `/0-INBOX/new-client-template/`
2. Review `/sops/v3-methodology.md` to understand the framework
3. Check `/examples/winning/` for inspiration

---

**Questions?** Start with the master SOP at `/sops/core-workflow/THE SCALESTREAM PRE-CALL SYSTEM™ SOP V3.0` 