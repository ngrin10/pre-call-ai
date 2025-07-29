# 🔍 Forensic Analysis System

**Unified system for analyzing sales transcripts at any scale**

---

## 🎯 Choose Your Path

### Decision Tree
```
How many transcripts?
├─ 1-5 → Use Path A: Quick Analysis
├─ 6-20 → Use Path B: Batch Analysis
└─ 20+ → Use Path C: Create CLAUDE.md for project automation
```

---

## 📊 Unified Awareness Framework

### The Interest Spectrum™
```
|-----------|------------|----------------|--------------|
Curious Interest → General Interest → Serious to Buy → Convicted
```

### Awareness Stage Mapping
- **PROBLEM AWARE** = Curious Interest (60% of prospects)
  - Knows problem, not solution category
  - "I'm tired of..." without knowing what fixes it
  
- **SOLUTION AWARE** = General Interest (30% of prospects)
  - Exploring solution options
  - "I've been looking at different ways to..."
  
- **PRODUCT AWARE** = Serious to Buy (8% of prospects)
  - Comparing specific vendors
  - "I'm evaluating you vs [competitor]..."
  
- **CONVICTED** = Ready to Buy (2% of prospects)
  - Only logistics questions remain
  - "How do I get started?"

---

## 🚀 Path A: Quick Analysis (1-5 transcripts)

### When to Use
- Initial client analysis
- Testing the system
- Small client samples
- Quick segment identification

### Copy This Prompt

```markdown
I need you to conduct a forensic analysis of my sales conversations to identify distinct prospect segments and create a hyper-personalized pre-call nurture system.

**BACKGROUND CONTEXT**:
[Paste client brief or business context here]

**TRANSCRIPTS**:
[Upload 1-5 transcripts]

════════════════════════════════════════════════════════════════

## 🔍 ANALYSIS FRAMEWORK

### 1. PSYCHOLOGICAL SEGMENTATION

**Current Reality Mapping:**
├─ Day-to-day pain (pull direct quotes)
├─ What triggered them to book this call
├─ Previous attempts and why they failed
├─ Hidden fears they don't explicitly state
├─ The story they tell themselves
├─ "Success" in their exact words
└─ Timeline pressure - why now vs later

**Decision-Making Psychology:**
├─ Evaluation style (emotional vs logical)
├─ Decision influencers (spouse, boss, peers)
├─ Past buying mistakes creating skepticism
├─ Risk tolerance and safety needs
├─ Decision speed (fast/slow and why)
├─ Proof preferences (data, stories, authority)
└─ Investment comfort and money mindset

**Awareness Journey Stage:**
Classify each prospect on the spectrum:
- [ ] PROBLEM AWARE (Curious) - "Just exploring"
- [ ] SOLUTION AWARE (General Interest) - "Comparing approaches"
- [ ] PRODUCT AWARE (Serious) - "Evaluating vendors"
- [ ] CONVICTED - "Ready to buy"

### 2. LANGUAGE FORENSICS

**Pain Articulation:**
├─ Top 10 phrases describing their problem
├─ Emotional words used repeatedly
├─ Industry-specific jargon/terminology
├─ How they describe ideal outcome
└─ Trigger words (positive/negative)

**Objection Language:**
├─ Exact phrasing variations:
│  • "I need to think about it" variations
│  • "I need to talk to [decision maker]" variations
│  • "I need to check finances" variations
├─ Specific doubt expressions
├─ Questions revealing hidden objections
└─ Tone shifts indicating concern

### 3. OBJECTION ARCHAEOLOGY

**Surface vs Root Analysis:**
For each objection:
┌─────────────────────────────────────────────┐
│ Surface: [What they said]                   │
│ Meaning: [What they meant]                  │
│ Root: [Deep fear/concern]                   │
└─────────────────────────────────────────────┘

### 4. CONVERSION PSYCHOLOGY

**The Tipping Point:**
├─ Key moments where everything shifted
├─ Specific phrases creating breakthrough
├─ Questions unlocking commitment
└─ Stories/examples creating "aha" moments

**Trust Builders:**
├─ What created credibility for this prospect
├─ Detail level needed before deciding
├─ Logic vs emotion preference shown
└─ Guarantee/safety requirements mentioned

### 5. SEGMENT PROFILES

For each distinct segment:

**Segment Name:** "[Memorable descriptor]"
**Awareness Level:** [Problem/Solution/Product/Convicted]
**Core Identity:**
├─ 3-4 defining characteristics
├─ Current situation summary
├─ Primary emotional driver
└─ Core objection to handle

**Pre-Call Content Recipe:**
├─ What they need to learn
├─ Objections to handle proactively
├─ Success stories to share
└─ Touch sequence (2-7 based on awareness)

════════════════════════════════════════════════════════════════

## OUTPUT DELIVERABLES

1. **Executive Summary** - Key patterns and segments
2. **Detailed Segment Profiles** - 3-5 distinct segments
3. **Objection Map** - Common objections with root causes
4. **Language Bank** - Exact phrases to use/avoid
5. **Pre-Call Sequences** - Content plan by segment
6. **Quick Wins** - Immediate implementation priorities
7. **Testing Framework** - What to A/B test first
```

---

## 📦 Path B: Batch Analysis (10+ transcripts)

### When to Use
- Complete client analysis
- Large transcript volumes
- Systematic processing
- Pattern identification across segments

### Orchestrator/Sub-Agent System

#### How It Works
1. **Orchestrator Agent** manages the overall analysis
2. **Sub-Agents** analyze individual transcripts
3. **Synthesis** combines patterns across all transcripts

### Instructions for Orchestrator Agent

```markdown
You are tasked with conducting a comprehensive forensic analysis of [CLIENT] sales transcripts to identify distinct prospect segments and create a hyper-personalized pre-call nurture system.

### YOUR RESOURCES:
1. **Background Info**: [Client brief/context]
2. **Transcript Location**: [Path to transcripts]
3. **Total Transcripts**: [Number]

### STEP 1: Launch Sub-Agents

For each transcript in your batch, launch a sub-agent with this prompt:

══════════════════════════════════════════════════════════════════════

Read transcript [X] and conduct forensic analysis following this EXACT structure:

## TRANSCRIPT IDENTIFIER:
- File name: [Insert filename]
- Prospect name/company: [Extract from transcript]
- Call outcome: [Closed/Lost/Ongoing/Unknown]

## 1. PSYCHOLOGICAL SEGMENTATION

### CURRENT REALITY MAPPING:
├─ Day-to-day pain (direct quotes)
├─ Call trigger
├─ Previous attempts
├─ Hidden fears
├─ Success definition
└─ Timeline pressure

### DECISION-MAKING PSYCHOLOGY:
├─ Evaluation style
├─ Decision influencers
├─ Past buying mistakes
├─ Risk tolerance
├─ Decision speed
├─ Proof preferences
└─ Investment mindset

### AWARENESS STAGE:
Classify into ONE:
[ ] PROBLEM AWARE - "[Descriptor]"
[ ] SOLUTION AWARE - "[Descriptor]"  
[ ] PRODUCT AWARE - "[Descriptor]"
[ ] CONVICTED - "[Descriptor]"

## 2. LANGUAGE FORENSICS

### PAIN ARTICULATION:
├─ Top 10 phrases (list all)
├─ Emotional words
├─ Industry jargon
├─ Ideal outcome description
└─ Trigger words

### OBJECTION LANGUAGE:
├─ Exact variations
├─ Doubt expressions
├─ Hidden objection questions
└─ Tone changes

## 3. OBJECTION ARCHAEOLOGY

### SURFACE VS ROOT:
┌─────────────────────────────────────────────┐
│ Surface: [What they said]                   │
│ Meaning: [What they meant]                  │
│ Root: [Deep fear]                           │
└─────────────────────────────────────────────┘

## 4. CONVERSION PSYCHOLOGY

### TIPPING POINTS:
├─ Key shift moments
├─ Breakthrough phrases
├─ Commitment questions
└─ "Aha" stories

### TRUST BUILDERS:
├─ Credibility creators
├─ Detail requirements
├─ Logic vs emotion
└─ Safety needs

## 5. INDIVIDUAL PROFILE

### CORE IDENTITY:
├─ 3-4 characteristics
├─ Situation summary
├─ Emotional driver
└─ Core objection

### CONVERSION LIKELIHOOD:
├─ Score (1-10): [X]
├─ Key to conversion: [Requirement]
├─ Major obstacle: [Barrier]
└─ Next action: [Step]

══════════════════════════════════════════════════════════════════════

### STEP 2: Synthesize Patterns

Once all sub-agents complete, create:

#### A. AWARENESS STAGE DISTRIBUTION

**PROBLEM AWARE PROFILE:**
```
STAGE: PROBLEM AWARE
SIZE: [X prospects]
PROSPECTS: [List with descriptors]

COMMON PATTERNS:
├─ Day-to-day pains
├─ Why no solutions yet
├─ Misconceptions
└─ Current workarounds

EXACT LANGUAGE:
├─ Pain phrases: [5-10 quotes]
├─ Frustration expressions
├─ "I wish..." statements
└─ Problem descriptions

MESSAGING PRESCRIPTION:
├─ Hook: Agitate the problem
├─ Education: Show what's possible
├─ Proof: Others succeeding
└─ Soft CTA: "Learn how..."

PRE-CALL CONTENT (5-7 touches):
├─ Touch 1: Problem agitation
├─ Touch 2: Transformation story
├─ Touch 3: Cost calculator
├─ Touch 4: Education piece
├─ Touch 5: Success story
├─ Touch 6: Solution invitation
└─ Touch 7: Personal outreach
```

[Repeat for SOLUTION AWARE and PRODUCT AWARE]

#### B. LANGUAGE FORENSICS SYNTHESIS

**PAIN ARTICULATION PATTERNS:**
├─ Top 10 phrases across all
├─ Common emotional words
├─ Industry jargon frequency
└─ Success description patterns

**OBJECTION LANGUAGE MAP:**
| Objection Type | Frequency | Variations | What Worked |
|----------------|-----------|------------|-------------|
| Price          | X/10      | [List]     | [Solutions] |
| Timing         | X/10      | [List]     | [Solutions] |
| Authority      | X/10      | [List]     | [Solutions] |
| Trust          | X/10      | [List]     | [Solutions] |

#### C. STRATEGIC RECOMMENDATIONS

**AWARENESS PRIORITIES:**
├─ Highest volume stage: [Which]
├─ Highest conversion stage: [%]
├─ Quick wins vs education plays
└─ Resource allocation

**CONTENT PRIORITIES:**
├─ Week 1: [Immediate needs]
├─ Week 2: [Secondary needs]
└─ Ongoing: [Maintenance]

### STEP 3: Create Deliverables

1. **Executive Summary** - Overall patterns
2. **Awareness Profiles** - Detailed segments
3. **Objection Map** - By awareness stage
4. **Language Bank** - By awareness stage
5. **Nurture Sequences** - Complete campaigns
6. **Movement Playbook** - Stage progression
7. **Testing Framework** - 30-day plan
```

### Batch Processing Tips

1. **Process in groups of 10** for optimal context
2. **Save individual analyses** before synthesis
3. **Track patterns** across batches
4. **Update master analysis** after each batch

---

## 🔨 Path C: Create Project CLAUDE.md (20+ transcripts)

### When to Use
- Very large transcript volumes
- Ongoing analysis needs
- Team collaboration
- Automated processing

### Template Generator

Use this to create a custom CLAUDE.md file for your project:

```markdown
# {{CLIENT_NAME}} SALES TRANSCRIPT FORENSIC ANALYSIS INSTRUCTIONS

## OVERVIEW
This document contains complete instructions for conducting forensic analysis of {{CLIENT_NAME}} sales transcripts.

Total transcripts to analyze: {{TOTAL_TRANSCRIPTS}}
Location: {{TRANSCRIPT_PATH}}

## BUSINESS CONTEXT
├─ Business: {{BUSINESS_DESCRIPTION}}
├─ Current Stats: {{CURRENT_STATS}}
├─ Volume: {{VOLUME_METRICS}}
├─ Price Point: {{PRICING_INFO}}
└─ Sales Process: {{SALES_PROCESS_INFO}}

## AWARENESS STAGE DEFINITIONS

### PROBLEM AWARE
Indicators for {{CLIENT_NAME}}:
{{PROBLEM_AWARE_INDICATORS}}

Search terms: {{PROBLEM_AWARE_SEARCH_TERMS}}

### SOLUTION AWARE
They understand {{SOLUTION_CATEGORY}} could help:
{{SOLUTION_AWARE_NEEDS}}

Comparing: {{SOLUTION_AWARE_COMPARISONS}}

### PRODUCT AWARE
Know about {{CLIENT_NAME}} specifically:
{{PRODUCT_AWARE_BEHAVIORS}}

Comparing against: {{COMPETITOR_LIST}}

## BATCH PROCESSING SCHEDULE
{{BATCH_LIST}}

## ORCHESTRATOR INSTRUCTIONS

When analyzing Batch X:
1. Identify transcript files for batch
2. Launch sub-agents with forensic template
3. Compile individual analyses
4. Synthesize patterns across batch
5. Update master analysis file

[Include full sub-agent template from Path B]

## DELIVERABLES
1. Individual transcript analyses
2. Batch synthesis reports
3. Master awareness profiles
4. Objection handling library
5. Language bank by segment
6. Nurture campaign templates
7. Testing framework

## USAGE
To analyze a batch:
"Read the instructions in CLAUDE.md and analyze Batch [X]"
```

### Variables to Replace
- `{{CLIENT_NAME}}` - Your client/company name
- `{{TOTAL_TRANSCRIPTS}}` - Number of transcripts
- `{{TRANSCRIPT_PATH}}` - Where transcripts are stored
- `{{BUSINESS_DESCRIPTION}}` - What they do
- `{{SOLUTION_CATEGORY}}` - Their solution type
- `{{PROBLEM_AWARE_INDICATORS}}` - Specific to their market
- `{{COMPETITOR_LIST}}` - Their main competitors
- All other `{{VARIABLES}}` - Based on your context

---

## 🔄 Implementation Guide

### Step 1: Assess Your Volume
```
1-5 transcripts → Path A (Quick Analysis)
6-20 transcripts → Path B (Batch Analysis)
20+ transcripts → Path C (Create CLAUDE.md)
```

### Step 2: Prepare Your Context
Always include:
- Business description
- Target audience details
- Current conversion metrics
- Main competitors
- Price points

### Step 3: Run Analysis
- Path A: Copy prompt, paste in Claude
- Path B: Use orchestrator instructions
- Path C: Generate CLAUDE.md first

### Step 4: Process Results
- Extract segment profiles
- Build language banks
- Create nurture sequences
- Set up testing

---

## 🤖 Automation Integration

### With ScaleStream Scripts

```bash
# For batch processing
./automation/process-transcripts.sh [client] [batch-number]

# For content generation
./automation/generate-content.sh [client] [awareness-level]

# For full pipeline
./automation/run-analysis.sh [client] [total-transcripts]
```

### Output Locations
```
/data/clients/[client]/
├── analysis/           # Analysis results
├── segments/          # Awareness profiles
├── content/           # Generated content
└── metrics/           # Performance tracking
```

---

## 📊 Consistent Analysis Structure

Regardless of path chosen, all analyses follow:

### 1. Psychological Segmentation
- Current reality mapping
- Decision-making psychology
- Awareness stage classification

### 2. Language Forensics
- Pain articulation
- Objection language
- Buying signals

### 3. Objection Archaeology
- Surface vs root causes
- Evidence that dissolves objections

### 4. Conversion Psychology
- Tipping points
- Trust builders
- Urgency triggers

### 5. Implementation Output
- Segment profiles
- Messaging prescriptions
- Content sequences
- Testing priorities

---

## ✅ Quality Checkpoints

### Before Analysis
- [ ] Clear on business context
- [ ] Transcripts properly formatted
- [ ] Aware of current metrics
- [ ] Know main competitors

### During Analysis
- [ ] Using extensive quotes
- [ ] Identifying patterns
- [ ] Classifying awareness accurately
- [ ] Finding root objections

### After Analysis
- [ ] Clear segment profiles
- [ ] Actionable language bank
- [ ] Complete nurture sequences
- [ ] Testing plan defined

---

## 🚀 Migration from Old System

### If Using `claude-md-template.md`
1. This replaces it entirely
2. Use Path B or C for batch processing
3. Same outputs, clearer structure

### If Using `01-forensic-analysis.md`
1. Use Path A for same functionality
2. Enhanced with awareness framework
3. Better segment definitions

### Updating References
```bash
# Old reference
/prompts/01-forensic-analysis.md

# New reference
/prompts/01-forensic-analysis-system.md
```

---

## 📚 Examples & Templates

### Example Awareness Classifications

**Problem Aware - Construction Company Owner**
- "I'm losing 20% of revenue to no-shows"
- Hasn't connected this to confirmation systems
- Searches: "reduce customer no-shows"

**Solution Aware - Med Spa Owner**
- "I need an automated booking system"
- Comparing different software options
- Searches: "best med spa booking software"

**Product Aware - Restoration Company**
- "I'm looking at your system vs ServiceTitan"
- Knows specific features needed
- Searches: "[YourBrand] vs ServiceTitan"

### Example Nurture Sequence (Problem Aware)

**Touch 1**: "The Hidden Cost of No-Shows"
**Touch 2**: "How Top Contractors Eliminated No-Shows"
**Touch 3**: "No-Show Cost Calculator"
**Touch 4**: "3 Ways to Reduce No-Shows Today"
**Touch 5**: "Case Study: 90% Show Rate Achieved"
**Touch 6**: "See How It Works (Video)"
**Touch 7**: "Quick Question About Your Biggest Challenge"

---

## 🎯 Remember

1. **Awareness drives everything** - Get classification right
2. **Quotes are evidence** - Use them extensively
3. **Patterns over individuals** - Look for commonalities
4. **Test your assumptions** - Let data guide you
5. **Movement is the goal** - Progress prospects up the spectrum

---

*Unified from `/0-INBOX/new-client-template/claude-md-template.md` and `/prompts/01-forensic-analysis.md`*
*Last Updated: [Current Date]*
*Version: 1.0 - Unified System*