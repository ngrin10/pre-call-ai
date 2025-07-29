# 🎯 SCALESTREAM MASTER ONBOARDING SYSTEM V3.0

## 🚀 Overview
This is the complete, unified onboarding system that takes a new client from initial contact through to implemented pre-call nurture sequences. Follow this EXACT order.

---

## 📊 Phase 0: Pre-Qualification (Before Anything Else)

### Mandatory Requirements Checklist
- [ ] **15+ sales call transcripts** available (non-negotiable)
- [ ] **12+ months in business** with existing sales process
- [ ] **10+ calls/month** minimum volume
- [ ] **Existing case studies** or success stories
- [ ] **Current marketing materials** (emails, website, etc.)

🚨 **STOP HERE if they don't meet ALL requirements**

---

## 📋 Phase 1: Initial Setup & Discovery

### Step 1.1: Create Client Workspace
```bash
./automation/quick-commands.sh new [client-name]
```

This creates:
- `/data/clients/[client-name]/` directory structure
- `client-brief.md` template
- `client-config.yaml` for custom CLAUDE.md generation

### Step 1.2: Send Onboarding Form
Send client the onboarding form to gather:
- Current performance metrics (show rate, close rate, etc.)
- Business information and offer details
- Competitive landscape
- Goals and expectations

### Step 1.3: Schedule Strategic Onboarding Call
- 90-minute deep dive call
- Use discovery questions from onboarding guide
- Document everything in `client-brief.md`

---

## 🔍 Phase 2: Data Collection & Analysis Prep

### Step 2.1: Collect Sales Transcripts
- VA collects transcripts using provided template
- Organize into batches of 5 in `/transcripts/`
- Name files: `batch-1.md`, `batch-2.md`, etc.

### Step 2.2: Gather Supporting Materials
Place in appropriate folders:
- `/resources/` - Case studies, testimonials
- `/resources/` - Current marketing materials
- `/resources/` - Competitive research

### Step 2.3: Complete Client Configuration
Edit `client-config.yaml` with:
- Business description and metrics
- Solution category and target audience
- Awareness stage indicators
- Competitor information
- Total transcript count

### Step 2.4: Generate Custom CLAUDE.md
```bash
./automation/quick-commands.sh setup [client-name]
```

---

## 🧪 Phase 3: Forensic Analysis

### Step 3.1: Run Quality Gates
```bash
./automation/quick-commands.sh check [client-name]
```

Ensures:
- ✅ 15+ transcripts present
- ✅ Client brief completed
- ✅ Configuration ready

### Step 3.2: Process Transcript Batches
```bash
./automation/quick-commands.sh analyze [client-name]
```

Or manually by batch:
```bash
./automation/process-transcripts.sh [client-name] 1
./automation/process-transcripts.sh [client-name] 2
# Continue for all batches...
```

### Step 3.3: Run Analysis in Claude
For each batch:
1. Copy prompt from `/analysis/batch-X-prompt.md`
2. Run in Claude with CLAUDE.md instructions
3. Save results to `/analysis/batch-X-results.md`

### Step 3.4: Synthesize Segments
After all batches:
1. Run synthesis prompt in Claude
2. Save to `/analysis/segment-synthesis.md`
3. Validate awareness distribution = 100%

---

## 📝 Phase 4: Content Generation

### Step 4.1: Generate Content by Awareness Level
```bash
# For each awareness level:
./automation/generate-content.sh [client-name] problem-aware
./automation/generate-content.sh [client-name] solution-aware
./automation/generate-content.sh [client-name] product-aware
```

### Step 4.2: Create Content in Claude
For each awareness level:
1. Use generated prompt from `/content/[awareness]/content-prompt.md`
2. Create email sequences (5-7 for problem, 4-5 for solution, 2-3 for product)
3. Create SMS flows (3-5 messages each)
4. Generate subject line variations

### Step 4.3: Review & Refine
- Ensure language matches transcript quotes
- Validate awareness journey progression
- Check timing and sequence flow

### Step 4.4: Generate Visual Assets (Optional)
```bash
# Create Gamma presentations for each awareness level
./automation/quick-commands.sh gamma [client-name]
```
- Creates educational deck for problem-aware
- Creates comparison guide for solution-aware
- Creates sales deck for product-aware
- Exports as PDFs for email attachments

---

## 🚀 Phase 5: Implementation

### Step 5.1: Platform Setup
- Import sequences to GHL/ActiveCampaign/etc.
- Configure automation triggers
- Set up tracking parameters

### Step 5.2: Testing Protocol
- [ ] Test all email sequences
- [ ] Verify SMS flow timing
- [ ] Check merge fields
- [ ] Validate tracking

### Step 5.3: Launch Checklist
- [ ] Baseline metrics documented
- [ ] Team trained on new process
- [ ] Monitoring dashboard ready
- [ ] First batch scheduled

---

## 📊 Phase 6: Optimization

### Week 1: Monitor & Adjust
- Daily show rate tracking
- Email engagement metrics
- Response rate monitoring

### Week 2-3: Initial Optimization
- A/B test subject lines
- Adjust timing based on engagement
- Refine messaging based on responses

### Week 4: Full Analysis
- Compare to baseline metrics
- Identify winning variations
- Plan next optimization cycle

---

## 🗂️ File Organization

### Client Directory Structure:
```
/data/clients/[client-name]/
├── client-brief.md          # Strategic context
├── client-config.yaml       # Configuration for CLAUDE.md
├── /transcripts/           # Sales call transcripts
│   ├── batch-1.md         # 5 transcripts per batch
│   ├── batch-2.md
│   └── ...
├── /analysis/             # Analysis outputs
│   ├── CLAUDE.md         # Custom analysis instructions
│   ├── batch-X-prompt.md # Batch prompts
│   ├── batch-X-results.md # Analysis results
│   └── segment-synthesis.md # Final segments
├── /content/              # Generated content
│   ├── /problem-aware/
│   ├── /solution-aware/
│   └── /product-aware/
├── /resources/            # Supporting materials
└── /metrics/             # Performance tracking
```

---

## 🎯 Success Metrics

### Primary KPIs:
- **Show Rate**: Target 15%+ improvement
- **Close Rate**: Focus on quality over quantity
- **Speed to Contact**: Under 5 minutes ideal

### Segment Movement:
- Problem → Solution: 3-5 touches over 48-72 hours
- Solution → Product: 2-3 touches over 24-48 hours  
- Product → Convicted: 1-2 touches in 24 hours

---

## ⚡ Quick Command Reference

```bash
# New client setup
./quick new [client-name]

# Generate CLAUDE.md
./quick setup [client-name]

# Run full analysis
./quick analyze [client-name]

# Generate content
./quick content [client-name] [awareness-level]

# Check status
./quick status [client-name]

# Quality gates
./quick check [client-name]
```

---

## 🚨 Common Pitfalls to Avoid

1. **Starting without enough transcripts** - Need 15+ minimum
2. **Skipping business context** - Brief is critical for analysis
3. **Guessing at segments** - Let data reveal the truth
4. **Generic messaging** - Use exact language from transcripts
5. **Rushing implementation** - Test everything first

---

## 📚 Additional Resources

- **Methodology**: `/sops/v3-methodology.md`
- **Examples**: `/examples/winning/`
- **Templates**: `/templates/`
- **Quality Gates**: `/tools/onboarding-quality-gates.md`

Remember: The system enforces quality at every step. Trust the process and follow the SOPs for predictable, scalable results.