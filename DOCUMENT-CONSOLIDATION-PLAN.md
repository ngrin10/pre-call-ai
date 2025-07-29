# 📋 Document Consolidation Plan

## 🔴 The Problem

We have 12+ documents saying similar things:
- Multiple "start here" guides
- Overlapping onboarding processes
- Duplicate workflow guides
- Confusing reference documents

## 🟢 The Solution

### Documents to KEEP (Core Process):

1. **START-HERE-MASTER-GUIDE.md** (New master document)
   - Single source of truth
   - Points to all other documents
   - Clear when to use what

2. **COMPLETE-ONBOARDING-FORM.md**
   - Client fills out before call
   - Single version, no duplicates

3. **discovery-call-guide.md**
   - Script for 90-minute call
   - Extracts deep insights

4. **COMPLETE-WORKFLOW-PHASES.md**
   - Week-by-week timeline
   - Implementation checklist

5. **claude-md-template.md**
   - For creating analysis instructions
   - One template to rule them all

### Documents to MERGE/DELETE:

#### Merge These Into START-HERE-MASTER-GUIDE.md:
- `/0-INBOX/README-START-HERE.md`
- `/docs/00-START-HERE.md`
- `/0-INBOX/new-client-template/README-ONBOARDING-PROCESS.md`
- `/0-INBOX/MASTER-ONBOARDING-SYSTEM.md`

#### Merge These Into COMPLETE-WORKFLOW-PHASES.md:
- `/docs/01-system-overview.md`
- `/docs/02-workflow-guide.md`
- `/data/clients/joe-smith/onboarding-checklist.md` (make it a template)

#### Keep as Reference Only:
- `/docs/KEY-FILES-REFERENCE.md` (update to point to new structure)
- `/docs/03-b2c-vs-b2b.md` (critical decision document)

## 📂 New Clear Structure

```
/ScaleStream/
├── START-HERE-MASTER-GUIDE.md         # ALWAYS start here
├── 0-INBOX/
│   ├── new-client-template/
│   │   ├── COMPLETE-ONBOARDING-FORM.md    # Client fills out
│   │   ├── discovery-call-guide.md        # Your call script
│   │   └── claude-md-template.md          # Analysis setup
│   └── COMPLETE-WORKFLOW-PHASES.md        # Weekly process
├── prompts/                                # Analysis prompts
├── examples/                               # Winning patterns
│   └── README.md                          # Examples guide
└── docs/
    └── 03-b2c-vs-b2b.md                  # Critical decision
```

## 🔄 Migration Steps

### Step 1: Create New Structure
- [x] Create START-HERE-MASTER-GUIDE.md
- [ ] Update COMPLETE-WORKFLOW-PHASES.md with all workflow info
- [ ] Clean up duplicate content

### Step 2: Update References
- [ ] Update all internal links
- [ ] Update automation scripts
- [ ] Update team documentation

### Step 3: Archive Old Files
- [ ] Move duplicates to `/archive/` folder
- [ ] Keep for 30 days then delete
- [ ] Document what was merged where

## 📝 Content Mapping

### What Goes Where:

#### START-HERE-MASTER-GUIDE.md should contain:
- Quick overview of entire system
- Which document to use when
- Decision tree for common scenarios
- Links to all core documents

#### COMPLETE-ONBOARDING-FORM.md should contain:
- All questions for client
- Nothing else - keep it simple

#### discovery-call-guide.md should contain:
- Question scripts
- What to listen for
- How to extract insights

#### COMPLETE-WORKFLOW-PHASES.md should contain:
- Week 1, 2, 3 breakdown
- Daily task lists
- Deliverable checklists
- Success metrics

## ✅ Benefits After Consolidation

1. **No more confusion** about where to start
2. **Single source of truth** for each process
3. **Clear hierarchy** of documents
4. **Faster onboarding** for new team members
5. **Reduced maintenance** burden

## 🚀 Implementation

### Phase 1 (Immediate):
- Use START-HERE-MASTER-GUIDE.md as entry point
- Stop creating new overlapping documents

### Phase 2 (This Week):
- Merge duplicate content
- Update all references
- Archive old files

### Phase 3 (Next Week):
- Train team on new structure
- Update any automation
- Delete archived files

---

## 🎯 Success Metrics

We'll know this worked when:
- New team members can start without confusion
- No more questions about "which document to use"
- Faster client onboarding
- Less time maintaining docs

---

*Remember: Less is more. One clear document beats ten confusing ones.*