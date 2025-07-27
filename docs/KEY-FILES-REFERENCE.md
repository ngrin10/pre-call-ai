# 🗺️ KEY FILES REFERENCE GUIDE

## Core Methodology Files

### 📚 V3.0 Methodology (`/sops/v3-methodology.md`)
**What it is**: The foundational awareness spectrum framework
**When to use**: Understanding the 60/30/8/2 distribution and three-layer segmentation
**Key concepts**:
- Primary layer: Awareness levels (Problem/Solution/Product)
- Secondary layer: Business context
- Tertiary layer: Psychology
- Move prospects up 2-3 levels between booking and showing

### 🎯 Awareness Segment Templates (`/templates/awareness-segments.md`)
**What it is**: Ready-to-use content templates for each awareness level
**When to use**: During content generation phase
**Includes**:
- Email templates for Problem/Solution/Product Aware
- SMS flows for each level
- Trust asset outlines
- Messaging frameworks
- Validation checklists

### 👤 VA Instructions Template (`/templates/va-instructions-email.md`)
**What it is**: Email template for assigning transcript collection to VAs
**When to use**: When outsourcing transcript collection
**Includes**:
- Initial assignment email
- Follow-up templates
- Quality control emails
- Platform-specific instructions (Gong, Fathom, Zoom)

### 📋 VA Transcript Collection SOP (`/sops/va-transcript-collection.md`)
**What it is**: Detailed process for VAs to collect quality transcripts
**When to use**: Training VAs or doing collection yourself
**Key points**:
- 20-25 transcripts optimal
- Quality over quantity
- Include variety of outcomes
- Note patterns and insights

## How They Connect in the Workflow

### Step 1: Understand the Framework
Read `/sops/v3-methodology.md` to understand:
- The awareness spectrum (60/30/8/2 rule)
- Three-layer segmentation approach
- Goal of moving prospects up 2-3 levels

### Step 2: Collect Transcripts
**Option A - VA Collection**:
1. Send email using `/templates/va-instructions-email.md`
2. Attach `/sops/va-transcript-collection.md` as reference
3. VA delivers 20-25 quality transcripts

**Option B - Direct Collection**:
1. Follow the process in `/sops/va-transcript-collection.md` yourself
2. Organize into batches of 5 (or 10 for large projects)

### Step 3: Run Analysis
1. Use forensic analysis prompt with V3.0 methodology principles
2. Identify awareness levels using framework
3. Apply three-layer segmentation

### Step 4: Generate Content
1. Reference `/templates/awareness-segments.md` for templates
2. Customize based on your analysis findings
3. Apply B2C or B2B styling as needed

## Processing Large Projects (10+ Batch Method)

For projects with 50+ transcripts (like the example in CLAUDE.md):
1. Process in batches of 10 instead of 5
2. Run parallel analyses to save time
3. Synthesize after every 30 transcripts
4. Adjust awareness percentages based on larger sample

## Quick Reference Checklist

**Before Starting**:
- [ ] Read V3.0 methodology
- [ ] Review awareness templates
- [ ] Prepare VA instructions if outsourcing

**During Collection**:
- [ ] Use VA SOP for quality standards
- [ ] Batch appropriately (5 or 10)
- [ ] Note initial patterns

**During Analysis**:
- [ ] Apply three-layer segmentation
- [ ] Validate against 60/30/8/2 rule
- [ ] Extract exact language

**During Content Creation**:
- [ ] Use awareness templates as base
- [ ] Customize with exact quotes
- [ ] Match B2C/B2B tone

## File Locations Summary

```
/sops/
├── v3-methodology.md              # Core framework
├── va-transcript-collection.md    # VA collection process
└── /core-workflow/               # Master SOP + B2C/B2B PDFs

/templates/
├── awareness-segments.md          # Content templates
└── va-instructions-email.md       # VA communication

/prompts/
├── 01-forensic-analysis.md       # Analysis prompt
├── 02-segment-synthesis.md       # Synthesis prompt
└── 03-content-generation.md      # Content prompt
```

## Pro Tips

1. **Start with the methodology** - Understanding V3.0 framework is crucial
2. **Use templates as starting points** - Never use generic content
3. **VA collection saves 3+ hours** - Worth the investment
4. **Batch size matters** - 5 for normal, 10 for large projects
5. **Always validate** - Check against methodology standards

---

This reference guide helps you understand which files to use when and how they all support the V3.0 SCALESTREAM methodology. 