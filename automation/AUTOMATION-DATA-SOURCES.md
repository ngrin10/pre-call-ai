# 🤖 Automation Data Sources Guide

This document explains where each automation script pulls data from and why.

## 📍 Primary Data Location

**ALL client insights are consolidated in:**
```
/data/clients/[client-name]/03-marketing-materials/00-client-insights/
```

This is the SINGLE SOURCE OF TRUTH for:
- Client business context
- Discovery call insights  
- B2B vs B2C classification
- Awareness level distribution
- Positioning opportunities

## 🔄 Script Data Sources

### `deep-research.sh`
**Reads from:**
```bash
# Primary source - consolidated insights
/03-marketing-materials/00-client-insights/client-insights-consolidation.md

# Secondary sources - current materials
/03-marketing-materials/06-positioning-docs/
/03-marketing-materials/08-performance-data/
/03-marketing-materials/09-faqs-objections/
```

**Why**: Needs full context to generate competitive analysis

---

### `generate-content.sh`
**Reads from:**
```bash
# Client context
/03-marketing-materials/00-client-insights/client-insights-consolidation.md

# Awareness distribution
/analysis/segment-synthesis.md

# Current messaging
/03-marketing-materials/01-email-sequences/
/03-marketing-materials/02-sms-templates/
```

**Why**: Needs to know WHO to write for and HOW they currently communicate

---

### `generate-gamma-assets.sh`
**Reads from:**
```bash
# Visual style preferences
/03-marketing-materials/00-client-insights/client-insights-consolidation.md

# Brand positioning
/03-marketing-materials/06-positioning-docs/

# Social proof available
/03-marketing-materials/05-social-proof/
```

**Why**: Visual assets must match brand and use real proof

---

### `process-transcripts.sh`
**Reads from:**
```bash
# Business context for analysis
/03-marketing-materials/00-client-insights/client-insights-consolidation.md

# Raw transcripts
/02-sales-transcripts/
```

**Writes to:**
```bash
# Analysis results
/analysis/
```

**Why**: Context improves transcript analysis accuracy

---

## 📊 Data Flow Diagram

```
INPUTS                          CONSOLIDATION                    OUTPUTS
                                     
Onboarding Form ─┐                                         ┌─→ Deep Research
                  ├─→ Client Insights ─→ All Scripts ─→ ├─→ Content
Discovery Call ──┘    Consolidation                     └─→ Visual Assets
                                                              
Current Materials ─→ Supporting Docs ─→ Additional Context
```

## ✅ Best Practices

### 1. Always Update Consolidation First
Before running ANY automation:
- Ensure insights doc is current
- All form responses transferred
- Discovery insights added

### 2. Check B2B vs B2C Flag
Scripts behave differently based on:
```markdown
### B2B vs B2C Decision
**Classification**: [B2B / B2C]  # THIS DRIVES EVERYTHING
```

### 3. Verify Awareness Percentages
Content generation depends on:
```markdown
### Primary Awareness Distribution
- **Problem Aware**: ___%  # Affects email tone
- **Solution Aware**: ___%  # Affects comparison content
- **Product Aware**: ___%   # Affects urgency tactics
```

## 🚨 Common Errors

### Error: "No insights found"
**Fix**: Create `/03-marketing-materials/00-client-insights/client-insights-consolidation.md`

### Error: "B2B/B2C not specified"
**Fix**: Add classification to insights document

### Error: "Awareness levels unclear"
**Fix**: Add percentage distribution to insights

## 🔧 Testing Data Sources

```bash
# Test if insights are readable
cat /data/clients/[client]/03-marketing-materials/00-client-insights/client-insights-consolidation.md

# Check for B2B/B2C flag
grep "Classification" /data/clients/[client]/03-marketing-materials/00-client-insights/client-insights-consolidation.md

# Verify awareness levels
grep "Problem Aware" /data/clients/[client]/03-marketing-materials/00-client-insights/client-insights-consolidation.md
```

---

## 🎯 Remember

**The `/00-client-insights/` folder is the brain of the operation.**

If automation isn't working correctly, check here first. This consolidated approach ensures:
- Nothing gets lost between form and call
- Scripts have consistent data access
- Content is properly personalized
- B2B vs B2C logic is applied correctly

---

*Last Updated: [Date]*
*Critical for: All automation scripts*