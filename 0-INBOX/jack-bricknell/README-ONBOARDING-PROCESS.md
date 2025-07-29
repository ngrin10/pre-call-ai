# 🚀 CLIENT ONBOARDING PROCESS - Master Guide

## Overview
The 0-INBOX is where ALL new client work begins. Follow this exact process for consistent, high-quality onboarding.

---

## 📋 THE CORRECT WORKFLOW

### Step 1: Create New Client Folder
```bash
cp -r 0-INBOX/new-client-template 0-INBOX/jack-bricknell
```

### Step 2: Gather Information (Days 1-3)
1. **Send onboarding form** → Add responses to `01-client-info.md`
2. **Schedule discovery call** → 90 minutes minimum
3. **Collect transcripts** → Minimum 15 required
4. **Gather marketing materials** → Current sequences, pages, etc.
5. **Research competitors** → Document in `05-research.md`

### Step 3: Document Everything
Fill out each file completely:
- `01-client-info.md` - Business context
- `02-sales-transcripts.md` - All transcripts with metadata
- `03-marketing-materials.md` - Current marketing assets
- `04-onboarding-call.md` - Discovery insights
- `05-research.md` - Competitive analysis
- `06-analysis-ready.md` - Final confirmation

### Step 4: Quality Check
Use `00-onboarding-checklist.md` to ensure:
- [ ] All files complete
- [ ] 15+ transcripts with metadata
- [ ] Business context clear
- [ ] Ready for analysis

---

## 🔄 ANALYSIS PROCESS

### Phase 1: Forensic Analysis (Per Batch)
1. Take 5 transcripts from `02-sales-transcripts.md`
2. Add business context from `01-client-info.md`
3. Use prompt: `/prompts/forensic-analysis.md`
4. Run in Claude/GPT
5. Save output to `/data/clients/[name]/analysis/batch-X-analysis.md`

### Phase 2: Segment Synthesis
1. After ALL batches analyzed
2. Combine all analyses
3. Use prompt: `/prompts/02-segment-synthesis.md`
4. Create unified profiles
5. Save to `/data/clients/[name]/segments/`

### Phase 3: Content Generation
1. Use segment profiles
2. Apply prompt: `/prompts/03-content-generation.md`
3. Generate awareness-specific content
4. Save to `/data/clients/[name]/content/[awareness-level]/`

---

## 📁 FILE MOVEMENT

### When Analysis Begins:
Move completed client folder from `0-INBOX` to `/data/clients/`:
```bash
mv 0-INBOX/jack-bricknell data/clients/jack-bricknell
```

### Folder Structure in `/data/clients/[name]/`:
```
/data/clients/jack-bricknell/
├── /analysis/          # Forensic analysis results
├── /segments/          # Awareness profiles
├── /content/           # Generated sequences
│   ├── /problem-aware/
│   ├── /solution-aware/
│   └── /product-aware/
├── /metrics/           # Performance tracking
└── client-brief.md     # Synthesized from 0-INBOX files
```

---

## ⚠️ CRITICAL RULES

1. **NO SHORTCUTS** - All 6 files must be complete
2. **MINIMUM 15 TRANSCRIPTS** - No exceptions
3. **BATCH IN 5s** - For analysis manageability
4. **INCLUDE CONTEXT** - Business info with EVERY analysis
5. **SAVE EVERYTHING** - Raw and processed outputs

---

## 🎯 Success Criteria

Before moving to analysis:
- [ ] Onboarding form complete
- [ ] Discovery call documented
- [ ] 15+ transcripts organized
- [ ] Marketing materials collected
- [ ] Competitive research done
- [ ] All files reviewed and complete

---

## 💡 Pro Tips

1. **Start collecting transcripts immediately** - This is usually the bottleneck
2. **Do competitive research during transcript collection** - Saves time
3. **Keep discovery call focused** - Use the template questions
4. **Batch transcripts as they arrive** - Don't wait for all 15
5. **Check metadata** - Outcome data is crucial for patterns

---

**Questions?** Check `/sops/onboarding/` for detailed procedures. 