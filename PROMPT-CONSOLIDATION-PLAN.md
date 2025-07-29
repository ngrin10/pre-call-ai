# 📋 Prompt Consolidation Plan

## 🔴 The Problem

We have two overlapping documents that confuse users:

1. **`/0-INBOX/new-client-template/claude-md-template.md`**
   - 684 lines
   - Designed for batch processing (10 transcripts at a time)
   - Uses orchestrator/sub-agent architecture
   - Creates a CLAUDE.md file for the project

2. **`/prompts/01-forensic-analysis.md`**
   - 319 lines
   - Direct prompt for copy-paste
   - Similar analysis structure
   - Simpler, single-agent approach

**Both cover:**
- Awareness stage classification (Problem/Solution/Product)
- Psychological segmentation
- Language forensics
- Objection archaeology
- Conversion psychology

## 🟢 The Solution

### Option 1: Unified System (RECOMMENDED)

Merge into ONE comprehensive system with clear use cases:

```
/prompts/01-forensic-analysis-system.md
├── Part A: Quick Analysis (1-5 transcripts)
│   └── Direct prompt version
├── Part B: Batch Analysis (10+ transcripts)
│   └── Orchestrator/sub-agent version
└── Part C: CLAUDE.md Generator
    └── Template for project instructions
```

### Option 2: Clear Separation

Keep both but clarify purpose:

1. **Rename `claude-md-template.md`** → `batch-analysis-template.md`
2. **Rename `01-forensic-analysis.md`** → `quick-analysis-prompt.md`
3. Add clear headers explaining when to use each

## 📝 Proposed Unified Structure

### NEW: `/prompts/01-forensic-analysis-system.md`

```markdown
# 🔍 Forensic Analysis System

## 🎯 Choose Your Path

### Path A: Quick Analysis (1-5 transcripts)
Use this for:
- Initial client analysis
- Testing the system
- Small client samples

[Include simplified prompt from current 01-forensic-analysis.md]

### Path B: Batch Analysis (10+ transcripts)
Use this for:
- Complete client analysis
- Large transcript volumes
- Systematic processing

[Include orchestrator system from claude-md-template.md]

### Path C: Create Project Instructions
Use this to:
- Generate a CLAUDE.md file
- Set up automated analysis
- Create reusable instructions

[Include template generator]
```

## 🔄 Key Improvements

### 1. Unified Awareness Framework
Both documents define awareness differently. Consolidate to:
- **Problem Aware**: Knows problem, not solution category
- **Solution Aware**: Exploring solution options
- **Product Aware**: Comparing specific vendors

### 2. Consistent Analysis Structure
Standardize the forensic analysis sections:
1. Psychological Segmentation
2. Language Forensics
3. Objection Archaeology
4. Conversion Psychology
5. Segment Profiles
6. Implementation Roadmap

### 3. Clear Decision Tree
```
How many transcripts?
├─ 1-5 → Use Quick Analysis
├─ 6-20 → Use Batch Analysis (2 batches)
└─ 20+ → Create CLAUDE.md for project
```

## 📊 Comparison of Current Overlap

| Element | CLAUDE.md Template | Forensic Prompt | Unified Approach |
|---------|-------------------|-----------------|------------------|
| Awareness Stages | Detailed with indicators | Spectrum model | Unified framework |
| Analysis Depth | Very detailed (684 lines) | Moderate (319 lines) | Scalable based on volume |
| Processing Method | Orchestrator + Sub-agents | Single agent | Both options available |
| Output Format | 7 deliverables | 7 deliverables | Consistent deliverables |
| Use Case | Large batches | Quick analysis | Clear decision tree |

## ✅ Migration Steps

### Step 1: Create Unified Document
- [ ] Merge best parts of both documents
- [ ] Remove redundancies
- [ ] Add clear decision criteria

### Step 2: Update References
- [ ] Update automation scripts
- [ ] Update workflow documents
- [ ] Update training materials

### Step 3: Archive Old Versions
- [ ] Move current files to `/archive/`
- [ ] Add deprecation notice
- [ ] Update all links

## 🎯 Benefits After Consolidation

1. **No more confusion** about which prompt to use
2. **Scalable approach** from 1 to 100+ transcripts
3. **Consistent analysis** regardless of volume
4. **Easier maintenance** with one source of truth
5. **Better results** with unified framework

## 📋 Implementation Checklist

### Immediate Actions:
- [ ] Review both documents for unique value
- [ ] Create consolidated structure
- [ ] Test with real transcripts

### This Week:
- [ ] Merge documents
- [ ] Update references
- [ ] Train team on new system

### Next Week:
- [ ] Archive old versions
- [ ] Monitor usage
- [ ] Refine based on feedback

---

## 🚨 Critical Decision

**Should we:**
1. Create one unified system (recommended)
2. Keep both with clearer names
3. Something else?

The unified approach reduces confusion and provides a scalable path from small to large analyses.