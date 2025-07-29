# 🔄 SCALESTREAM MASTER FLOW DIAGRAM
**How All The Files Work Together**

## 🎯 THE BIG PICTURE
```
Client Onboarding → Transcript Analysis → Segment Creation → Content Generation → Technical Setup → Launch
     ↓                    ↓                    ↓                    ↓                   ↓              ↓
[Commands]          [Prompts]           [Templates]          [Automation]         [Platform]     [Metrics]
```

## 📚 Core Methodology References
- **V3.0 Methodology**: `/sops/v3-methodology.md` - The awareness spectrum framework
- **Awareness Templates**: `/templates/awareness-segments.md` - Content templates for each level
- **VA Instructions**: `/templates/va-instructions-email.md` - Template for VA transcript collection
- **VA SOP**: `/sops/va-transcript-collection.md` - Detailed VA collection process

## 🔴 CRITICAL FORK: B2C vs B2B Decision

**This decision in client-brief.md affects EVERYTHING:**

```
B2C (Selling to Public)                    B2B (Selling to Rich/Executives)
├── Emotional journey focus                ├── ROI and time-saving focus
├── Mass psychology approach               ├── Executive psychology approach
├── Price: $997-$5K                       ├── Price: $10K-$100K+
├── Volume: 100-1000+ clients             ├── Volume: 10-50 clients
├── Trust through social proof            ├── Trust through competence
└── Templates: B2C_*.pdf files            └── Templates: B2B_*.pdf files
```

**Content Templates Used:**
- **B2C**: Uses emotional transformation templates from `/sops/core-workflow/B2C_*.pdf`
- **B2B**: Uses ROI/efficiency templates (need to be uploaded to same folder)

## 📋 STEP-BY-STEP FLOW WITH ACTUAL FILES

### 🚀 STEP 1: NEW CLIENT SETUP
```bash
./automation/quick-commands.sh new [client-name]
```
**What happens:**
1. Creates `/data/clients/[client-name]/` directory structure
2. Generates `client-brief.md` template
3. Sets up folders for transcripts, analysis, segments, content

**You edit:** `/data/clients/[client-name]/client-brief.md`

---

### 📝 STEP 2: TRANSCRIPT COLLECTION
**Option A: VA Collection**
1. Use template: `/templates/va-instructions-email.md`
2. Follow SOP: `/sops/va-transcript-collection.md`
3. VA delivers 20-25 transcripts with quality notes

**Option B: Direct Collection**
1. Gather 15-20 transcripts from client
2. Organize into batches of 5 in `/data/clients/[client-name]/transcripts/batch-X.md`

**Pro Tip**: Process in batches of 10 for larger projects (see batch processing method)

---

### 🔍 STEP 3: RUN FORENSIC ANALYSIS
```bash
./automation/process-transcripts.sh [client-name] 1
```

**What happens:**
1. Script loads `client-brief.md` for context
2. Creates analysis prompt using `/prompts/01-forensic-analysis-system.md`
3. Applies V3.0 methodology from `/sops/v3-methodology.md`
4. Outputs to `/data/clients/[client-name]/analysis/batch-1-prompt.md`

**You do:**
1. Copy prompt to Claude
2. Run analysis using awareness spectrum framework
3. Save results to `/data/clients/[client-name]/analysis/batch-1-results.md`

**The prompt analyzes:**
- Awareness levels (Problem/Solution/Product) - see `/sops/v3-methodology.md`
- Language patterns using three-layer segmentation
- Objections and trust requirements
- Secondary and tertiary characteristics

---

### 🔄 STEP 4: SYNTHESIZE SEGMENTS
```bash
./automation/run-analysis.sh [client-name] [total-transcripts]
```

**What happens:**
1. Combines all batch results
2. Uses `/prompts/02-segment-synthesis.md`
3. Creates unified segment profiles following V3.0 structure
4. Validates against awareness distribution (60/30/8/2 rule)

**Output:** `/data/clients/[client-name]/segments/awareness-profiles.md`

---

### ✍️ STEP 5: GENERATE CONTENT
```bash
./automation/generate-content.sh [client-name] problem-aware
./automation/generate-content.sh [client-name] solution-aware
./automation/generate-content.sh [client-name] product-aware
```

**What happens:**
1. Loads segment profiles
2. Uses `/prompts/03-content-generation.md`
3. Applies templates from `/templates/awareness-segments.md`
4. **References B2C/B2B templates based on business model**
5. Creates awareness-specific content

**Output structure:**
```
/data/clients/[client-name]/content/
├── problem-aware/
│   ├── email-sequence.md (5-7 emails from templates)
│   ├── sms-flow.md (4-5 messages)
│   └── trust-assets.md (guides, calculators)
├── solution-aware/
│   ├── email-sequence.md (3-5 emails from templates)
│   ├── sms-flow.md (4-5 messages)
│   └── trust-assets.md (case studies, ROI)
└── product-aware/
    ├── email-sequence.md (2-3 emails from templates)
    ├── sms-flow.md (4-5 messages)
    └── trust-assets.md (comparisons, guarantees)
```

---

### 🔧 STEP 6: TECHNICAL IMPLEMENTATION
**Manual process using:**
- `/sops/core-workflow/THE SCALESTREAM PRE-CALL SYSTEM™ SOP V3.0` (Phase 4)
- Platform: GoHighLevel
- SMS: SendBlue
- Integration: Zapier

**You build:**
1. GHL workflows for each awareness level
2. Email campaigns with segment triggers
3. SMS automations with personalization
4. Tracking and tagging system

---

### ✅ STEP 7: QUALITY CHECK
```bash
./automation/quick-commands.sh check [client-name]
```

**Checks against:**
- V3.0 methodology standards
- Awareness level content alignment
- Proper segment routing
- Technical integrations
- Tracking functionality

---

### 🚀 STEP 8: LAUNCH
```bash
./automation/quick-commands.sh status [client-name]
```

**Final checklist from:**
- `/sops/core-workflow/complete-workflow.md`
- `/sops/core-workflow/timeline.md`

---

## 🔗 FILE CONNECTIONS MAP

```
METHODOLOGY LAYER
├── /sops/v3-methodology.md (Awareness spectrum framework)
├── /templates/awareness-segments.md (Content templates)
└── /sops/va-transcript-collection.md (VA process)

MASTER SOP
└── /sops/core-workflow/THE SCALESTREAM PRE-CALL SYSTEM™ SOP V3.0
    ├── Phases 1-7 detailed instructions
    └── Links to all components

B2C vs B2B FORK (CRITICAL DECISION POINT)
├── B2C TEMPLATES (/sops/core-workflow/)
│   ├── B2C_Confirmation_Email_[Awareness].pdf (3 files)
│   ├── B2C_Confirmation_Video_[Awareness]_V2.pdf (3 files)
│   ├── WSI Email Strategy - Complete Writing Guide.pdf
│   ├── WSI Segment-Specific Messaging Strategy.pdf
│   └── WSI Segments by Awareness Level.pdf
│
└── B2B TEMPLATES (TO BE ADDED)
    ├── B2B_Executive_Messaging_Templates.pdf
    ├── B2B_ROI_Calculator_Templates.pdf
    └── B2B_Time_Value_Frameworks.pdf

AUTOMATION LAYER
├── /automation/quick-commands.sh (main CLI)
├── /automation/process-transcripts.sh (batch analysis)
├── /automation/run-analysis.sh (full pipeline)
└── /automation/generate-content.sh (content creation)

PROMPT SEQUENCE
├── /prompts/01-forensic-analysis-system.md (unified analysis system)
├── /prompts/02-segment-synthesis.md (combine analyses)
├── /prompts/03-content-generation.md (create content)
├── /prompts/04-review-refinement.md (quality check)
└── /prompts/05-quick-prompts.md (quick reference)

TEMPLATES & EXAMPLES
├── /templates/awareness-segments.md (Awareness level content templates)
├── /templates/va-instructions-email.md (VA communication template)
├── /examples/winning/*.md (high-converting examples)
└── /examples/avoid/*.md (common mistakes)

CLIENT DATA
└── /data/clients/[client-name]/
    ├── client-brief.md (business context - INCLUDES B2C/B2B DESIGNATION)
    ├── /transcripts/ (raw data input)
    ├── /analysis/ (processing results)
    ├── /segments/ (validated profiles)
    └── /content/ (generated materials)
```

## 🎮 COMMAND FLOW

1. **Start:** `./quick new acme-corp`
2. **Add data:** Edit client-brief.md, add transcripts
3. **Analyze:** `./quick analyze acme-corp`
4. **Generate:** `./quick content acme-corp problem-aware`
5. **Check:** `./quick check acme-corp`
6. **Status:** `./quick status acme-corp`

## 💡 HOW IT ALL FLOWS TOGETHER

```
1. ONBOARDING CALL → Fills client-brief.md → Context for everything
                ↓
   [B2C vs B2B DECISION POINT]
                ↓
2. VA COLLECTION → Using templates → 20-25 quality transcripts
                ↓
3. TRANSCRIPTS → Batch files → Forensic analysis → Awareness segments
                ↓
   [APPLY V3.0 METHODOLOGY]
                ↓
4. SEGMENTS → Problem/Solution/Product profiles → Content strategy
                ↓
   [USE AWARENESS TEMPLATES]
                ↓
5. CONTENT → Emails/SMS/Assets per awareness → Platform setup
                ↓
6. AUTOMATION → GHL workflows → SendBlue SMS → Zapier connections
                ↓
7. LAUNCH → Monitor metrics → Optimize by segment → Scale
```

## 🎯 THE KEY INSIGHT

Everything revolves around the **Awareness Spectrum** (V3.0 Methodology):
- 60% are Problem Aware (need education)
- 30% are Solution Aware (need differentiation)
- 8% are Product Aware (need urgency)
- 2% are Convicted (need logistics)

Each file and process serves to:
1. **Identify** where prospects are on the spectrum
2. **Create** content to move them up levels
3. **Automate** delivery based on their awareness
4. **Track** progression and optimize

---

Next: [B2C vs B2B Decision Guide](./03-b2c-vs-b2b.md) 