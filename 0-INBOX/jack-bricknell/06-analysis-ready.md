# ✅ Analysis Ready Confirmation - [CLIENT NAME]

## 📋 Pre-Analysis Checklist

### Required Materials ✓
- [ ] **15+ Sales Transcripts** with metadata
- [ ] **Client Information** fully documented
- [ ] **Marketing Materials** collected
- [ ] **Onboarding Call** notes complete
- [ ] **Competitive Research** done

### Quality Checks ✓
- [ ] All transcripts include outcome data
- [ ] Business context is clear
- [ ] Unique differentiators identified
- [ ] Current performance metrics documented
- [ ] Success metrics defined

---

## 📊 Summary for Analysis

### Business Snapshot
- **Company**: 
- **Offer**: 
- **Price Point**: $
- **Current Show Rate**: %
- **Target Show Rate**: %

### Transcript Summary
- **Total Transcripts**: 
- **Closed Won**: 
- **Closed Lost**: 
- **No Shows**: 
- **Date Range**: 

### Key Hypotheses
1. **Awareness Distribution**: 
   - Problem Aware: ~%
   - Solution Aware: ~%
   - Product Aware: ~%

2. **Main Opportunity**: 

3. **Quick Wins**: 

---

## 🎯 Analysis Instructions

### Step 1: Forensic Analysis
Use prompt: `/prompts/forensic-analysis.md`

**For each batch of 5 transcripts:**
1. Include business context from `01-client-info.md`
2. Include competitive insights from `05-research.md`
3. Run forensic analysis
4. Save results to `/data/clients/[name]/analysis/batch-X-analysis.md`

### Step 2: Segment Synthesis
After all batches analyzed:
1. Combine all batch analyses
2. Use prompt: `/prompts/02-segment-synthesis.md`
3. Create unified segment profiles
4. Save to `/data/clients/[name]/segments/awareness-profiles.md`

### Step 3: Content Strategy
Based on segments:
1. Use prompt: `/prompts/03-content-generation.md`
2. Generate awareness-specific content
3. Save to appropriate folders

---

## 📁 File Locations

**Source Files:**
- Client Info: `0-INBOX/[client]/01-client-info.md`
- Transcripts: `0-INBOX/[client]/02-sales-transcripts.md`
- Marketing: `0-INBOX/[client]/03-marketing-materials.md`
- Call Notes: `0-INBOX/[client]/04-onboarding-call.md`
- Research: `0-INBOX/[client]/05-research.md`

**Output Locations:**
- Analysis: `/data/clients/[client]/analysis/`
- Segments: `/data/clients/[client]/segments/`
- Content: `/data/clients/[client]/content/`

---

## ✅ Final Confirmation

**All materials collected?** Yes / No
**Ready for analysis?** Yes / No
**Analyst assigned?** [NAME]
**Target completion?** [DATE]

---

**Confirmed By**: [NAME]
**Date**: [DATE]
**Time**: [TIME] 