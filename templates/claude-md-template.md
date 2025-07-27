# {{CLIENT_NAME}} SALES TRANSCRIPT FORENSIC ANALYSIS INSTRUCTIONS

## OVERVIEW
This document contains complete instructions for conducting forensic analysis of {{CLIENT_NAME}} sales transcripts. The analysis is designed to identify distinct prospect segments and create hyper-personalized pre-call nurture systems.

Total transcripts to analyze: {{TOTAL_TRANSCRIPTS}} (located in `{{TRANSCRIPT_PATH}}`)

## BATCH BREAKDOWN
{{BATCH_LIST}}

## AWARENESS STAGE CLASSIFICATION FRAMEWORK

### How to Define Prospects in Each Awareness Stage for {{CLIENT_NAME}}:

#### PROBLEM AWARE
These prospects recognize they have challenges but haven't connected them to a specific solution category yet. They experience:

{{PROBLEM_AWARE_INDICATORS}}

They search for terms like {{PROBLEM_AWARE_SEARCH_TERMS}}

#### SOLUTION AWARE
These prospects understand that {{SOLUTION_CATEGORY}} could solve their problems. They know they need:

{{SOLUTION_AWARE_NEEDS}}

They're comparing different approaches like {{SOLUTION_AWARE_COMPARISONS}}. They search for {{SOLUTION_AWARE_SEARCH_TERMS}}

#### PRODUCT AWARE
These prospects specifically know about {{CLIENT_NAME}} or similar specialized solutions. They:

{{PRODUCT_AWARE_BEHAVIORS}}

They're actively comparing {{CLIENT_NAME}} against alternatives like:

{{COMPETITOR_LIST}}

They search for terms like:
{{PRODUCT_AWARE_SEARCH_TERMS}}

At this stage, they need clear differentiation on why {{CLIENT_NAME}} is the better choice for their specific use case - {{DIFFERENTIATION_POINTS}}

## ORCHESTRATOR AGENT INSTRUCTIONS

### FOR EACH BATCH:

You are tasked with conducting a comprehensive forensic analysis of {{CLIENT_NAME}} sales transcripts to identify distinct prospect segments and create a hyper-personalized pre-call nurture system.

### YOUR RESOURCES:
1. **Background Info**: `{{BACKGROUND_FILE_PATH}}`
2. **Transcript Location**: `{{TRANSCRIPT_PATH}}`

### BACKGROUND CONTEXT FOR ALL ANALYSES:
├─ Business: {{BUSINESS_DESCRIPTION}}
├─ Current Stats: {{CURRENT_STATS}}
├─ Volume: {{VOLUME_METRICS}}
├─ Price Point: {{PRICING_INFO}}
└─ Sales Process: {{SALES_PROCESS_INFO}}

### YOUR TASK:

#### STEP 1: Identify Your Batch
When instructed to analyze a specific batch (e.g., "Batch 3: Transcripts 21-30"), first list all JSON files in the transcript directory and identify the 10 files for your batch based on alphabetical order.

#### STEP 2: Launch 10 Sub-Agents Simultaneously

For each transcript in your batch, launch a sub-agent with this EXACT prompt:

```
Read the transcript at [INSERT TRANSCRIPT PATH] and the background information at {{BACKGROUND_FILE_PATH}}

Conduct a forensic analysis of this INDIVIDUAL transcript following the EXACT structure below. You must address EVERY subsection with specific details from the transcript. Use direct quotes extensively.

═══════════════════════════════════════════════════════════════════════

## TRANSCRIPT IDENTIFIER:
- File name: [Insert filename]
- Prospect name/company: [Extract from transcript]
- Date of call: [Extract from filename]
- Call outcome: [Closed/Lost/Ongoing/Unknown - based on evidence]

═══════════════════════════════════════════════════════════════════════

## 1. PSYCHOLOGICAL SEGMENTATION

### CURRENT REALITY MAPPING:
├─ Day-to-day pain (pull direct quotes)
├─ What triggered them to book this call
├─ Previous attempts and why they failed
├─ Hidden fears they don't explicitly state
├─ The story they tell themselves
├─ "Success" in their exact words
└─ Timeline pressure - why now vs later

### DECISION-MAKING PSYCHOLOGY:
├─ Evaluation style (emotional vs logical)
├─ Decision influencers (spouse, boss, peers)
├─ Past buying mistakes creating skepticism
├─ Risk tolerance and safety needs
├─ Decision speed (fast/slow and why)
├─ Proof preferences (data, stories, authority)
└─ Investment comfort and money mindset

### AWARENESS JOURNEY STAGE:
├─ Specific rabbit holes they've explored
├─ Competitors looked at and rejected (why)
├─ Misconceptions about the solution
├─ Knowledge gaps preventing progress
├─ Trust barriers from past experiences
└─ Emotional state (hopeful/skeptical/desperate)

═══════════════════════════════════════════════════════════════════════

## 2. LANGUAGE FORENSICS

### PAIN ARTICULATION:
├─ Top 10 phrases describing their problem (list all 10 or note if fewer)
├─ Emotional words used repeatedly
├─ Industry-specific jargon/terminology
├─ How they describe ideal outcome
└─ Trigger words (positive/negative)

### OBJECTION LANGUAGE:
├─ Exact phrasing variations:
│  • "I need to think about it" variations
│  • "I need to talk to my wife/partner" variations
│  • "I need to see if I can move money around" variations
│  • Other decision delay phrases
├─ Specific doubt expressions
├─ Questions revealing hidden objections
└─ Tone/body language changes (if noted in transcript)

### BUYING SIGNALS:
├─ Phrases indicating readiness to buy
├─ Genuine interest vs politeness questions
├─ Language shifts (skeptical → interested)
└─ Timeline and urgency expressions

═══════════════════════════════════════════════════════════════════════

## 3. OBJECTION ARCHAEOLOGY

### SURFACE VS ROOT ANALYSIS:
For each objection, create a table:
┌─────────────────────────────────────────────┐
│ Surface: [What they actually said]          │
│ Meaning: [What they really mean]            │
│ Root: [Deep underlying fear/concern]        │
└─────────────────────────────────────────────┘

### THIS PROSPECT'S OBJECTIONS:
├─ List all objections raised
├─ Order of appearance
├─ Which were deal-breakers
└─ Which were overcome (and how)

### EVIDENCE THAT DISSOLVED OBJECTIONS:
├─ Specific proof points that worked
├─ Stories that resonated
├─ Data points that mattered
└─ Social proof that landed

═══════════════════════════════════════════════════════════════════════

## 4. CONVERSION PSYCHOLOGY

### THE TIPPING POINT:
├─ Key moments where everything shifted
├─ Specific phrases creating breakthrough
├─ Questions unlocking commitment
└─ Stories/examples creating "aha" moments

### TRUST BUILDERS:
├─ What created credibility for this prospect
├─ Detail level needed before deciding
├─ Logic vs emotion preference shown
└─ Guarantee/safety requirements mentioned

### URGENCY TRIGGERS:
├─ What drove immediate action (if any)
├─ External pressure factors mentioned
├─ Internal change motivations revealed
└─ Competitive dynamics affecting timing

═══════════════════════════════════════════════════════════════════════

## 5. CONTENT CONSUMPTION PATTERNS

### LEARNING STYLE:
├─ Bullet points vs detailed explanations preference
├─ Video vs written content preference (if mentioned)
├─ Optimal proof amount (avoiding overwhelm)
└─ Attention span and content length tolerance

### OBJECTION HANDLING PREFERENCE:
├─ Direct vs subtle addressing preference
├─ Public (testimonials) vs private (FAQ) trust
└─ Comfort level with "selling" approach

### PRE-CALL BEHAVIOR:
├─ What drove them to book the call
├─ Research mentioned before call
├─ Questions prepared in advance
└─ Engagement level indicators

═══════════════════════════════════════════════════════════════════════

## 6. COMPETITIVE INTELLIGENCE

### COMPETITOR AWARENESS:
├─ Who they've evaluated (specific names)
├─ Why they didn't buy elsewhere
├─ Solution misconceptions revealed
└─ Feature comparisons made

### DIFFERENTIATION OPPORTUNITIES:
├─ Competitor gaps mentioned
├─ Unique advantages that resonated
├─ Exclusive features that mattered
└─ Positioning that worked

═══════════════════════════════════════════════════════════════════════

## 7. INDIVIDUAL PROSPECT PROFILE

### AWARENESS STAGE CLASSIFICATION:
Classify this prospect into ONE of the following stages based on the AWARENESS STAGE CLASSIFICATION FRAMEWORK:

[ ] PROBLEM AWARE - "[Specific descriptor]"
    - Recognizes challenges but hasn't connected them to {{SOLUTION_CATEGORY}}
    - Experiences pain like {{PROBLEM_AWARE_PAIN_POINTS}}
    - No awareness of {{SOLUTION_CATEGORY}} category
    
[ ] SOLUTION AWARE - "[Specific descriptor]"  
    - Understands {{SOLUTION_CATEGORY}} could help
    - Knows they need {{SOLUTION_AWARE_REQUIREMENTS}}
    - Not yet comparing specific products
    
[ ] PRODUCT AWARE - "[Specific descriptor]"
    - Knows about {{CLIENT_NAME}} or specific competitors ({{MAIN_COMPETITORS}})
    - Actively comparing features, pricing, implementation
    - Making vendor-specific evaluations

### STAGE INDICATORS FROM TRANSCRIPT:
├─ Specific quotes showing their awareness level
├─ Research mentioned (or lack thereof)
├─ Competitor knowledge demonstrated
└─ Questions asked revealing their stage

### CORE IDENTITY:
├─ 3-4 defining characteristics
├─ Current situation summary
├─ Primary emotional driver
└─ Core objection to handle

### CONVERSION LIKELIHOOD:
├─ Score (1-10): [X]
├─ Key to conversion: [Main requirement]
├─ Major obstacle: [Primary barrier]
└─ Recommended next action: [Specific step]

═══════════════════════════════════════════════════════════════════════

CRITICAL INSTRUCTIONS:
- Address EVERY subsection (mark "Not evident" if no data)
- Use extensive direct quotes
- Be specific, not general
- Focus only on THIS transcript
- Maintain all formatting exactly
- List all 10 items where "Top 10" is requested
```

#### STEP 3: Compile Individual Analyses
Once all 10 sub-agents complete:
1. Create file: `{{OUTPUT_PATH}}/detailed_analysis_batch_[X]_transcripts_[Y-Z].md`
2. Include each complete individual analysis with clear separators
3. Save individual analysis files: `Analysis_Call[#]_[Outcome].txt` for each transcript

#### STEP 4: ORCHESTRATOR SYNTHESIS (YOUR UNIQUE ROLE)

Now synthesize patterns ACROSS all 10 transcripts to create segment profiles and nurture strategies:

═══════════════════════════════════════════════════════════════════════

### A. AWARENESS STAGE DISTRIBUTION & PROFILING

Analyze all 10 transcripts and categorize by awareness stage. Create detailed profiles for each stage:

#### PROBLEM AWARE PROFILE:
```
STAGE: PROBLEM AWARE
SIZE: [X prospects from this batch]
PROSPECTS: [List transcript numbers with specific descriptors]
Example: "Transcript 3 - {{PROBLEM_AWARE_EXAMPLE}}"

COMMON PATTERNS:
├─ Day-to-day pains they articulate
├─ Why they haven't found solutions yet
├─ Misconceptions about what's possible
└─ Current workarounds and band-aids

EXACT LANGUAGE USED:
├─ Pain phrases: [List 5-10 exact quotes]
├─ Frustration expressions: [Direct quotes]
├─ "I wish..." statements: [Direct quotes]
└─ Problem descriptions: [How they articulate it]

MESSAGING PRESCRIPTION:
├─ Hook: Agitate the problem they know
├─ Education: Show them what's possible
├─ Proof: Others like them succeeding
└─ Soft CTA: "Learn how {{TARGET_AUDIENCE}} are..."

PRE-CALL CONTENT (5-7 touches):
├─ Touch 1: Problem agitation + possibility
├─ Touch 2: Industry transformation story
├─ Touch 3: Cost of status quo calculator
├─ Touch 4: "Did you know?" education
├─ Touch 5: Success story from similar {{TARGET_DESCRIPTOR}}
├─ Touch 6: Invitation to explore solution
└─ Touch 7: Personal outreach if no response

CONVERSION FORMULA:
├─ Current show rate: [X%]
├─ Expected improvement: [X%]
├─ Key requirement: Education before selling
└─ Success metric: Move to Solution Aware
```

#### SOLUTION AWARE PROFILE:
```
STAGE: SOLUTION AWARE
SIZE: [X prospects from this batch]
PROSPECTS: [List transcript numbers with specific descriptors]
Example: "Transcript 7 - {{SOLUTION_AWARE_EXAMPLE}}"

COMMON PATTERNS:
├─ Solutions they've tried/evaluated
├─ Why current tools aren't working
├─ Specific comparison criteria
└─ Trust barriers from past failures

EXACT LANGUAGE USED:
├─ Comparison phrases: [Direct quotes]
├─ Skepticism expressions: [Direct quotes]
├─ "But what about..." questions: [Direct quotes]
└─ Feature requirements: [Direct quotes]

MESSAGING PRESCRIPTION:
├─ Hook: "Why {{CLIENT_NAME}} is different"
├─ Differentiation: Unique advantages
├─ Trust: Address past failures directly
└─ Comparison CTA: "See the difference"

PRE-CALL CONTENT (4-5 touches):
├─ Touch 1: "Why {{TARGET_AUDIENCE}} switch" story
├─ Touch 2: Head-to-head comparison
├─ Touch 3: ROI calculator with real numbers
├─ Touch 4: Implementation success guide
└─ Touch 5: Risk-free trial emphasis

CONVERSION FORMULA:
├─ Current show rate: [X%]
├─ Expected improvement: [X%]
├─ Key requirement: Differentiation clarity
└─ Success metric: Move to Product Aware
```

#### PRODUCT AWARE PROFILE:
```
STAGE: PRODUCT AWARE
SIZE: [X prospects from this batch]
PROSPECTS: [List transcript numbers with specific descriptors]
Example: "Transcript 15 - {{PRODUCT_AWARE_EXAMPLE}}"

COMMON PATTERNS:
├─ How they heard about {{CLIENT_NAME}}
├─ Specific features they're seeking
├─ Timeline and urgency indicators
└─ Final hesitations or logistics questions

EXACT LANGUAGE USED:
├─ Readiness signals: [Direct quotes]
├─ Urgency expressions: [Direct quotes]
├─ Logistics questions: [Direct quotes]
└─ "When can we..." phrases: [Direct quotes]

MESSAGING PRESCRIPTION:
├─ Hook: "You're making the right choice"
├─ Confidence: Implementation success
├─ Urgency: Limited time offers
└─ Direct CTA: "Let's get you started"

PRE-CALL CONTENT (2-3 touches):
├─ Touch 1: Implementation timeline + quick wins
├─ Touch 2: Limited-time incentive
└─ Touch 3: Pre-call prep checklist

CONVERSION FORMULA:
├─ Current show rate: [X%]
├─ Expected improvement: [X%]
├─ Key requirement: Remove final friction
└─ Success metric: Show up ready to buy
```

═══════════════════════════════════════════════════════════════════════

### B. LANGUAGE FORENSICS SYNTHESIS

#### PAIN ARTICULATION PATTERNS:
├─ Top 10 phrases describing problems (across all transcripts)
├─ Most common emotional words
├─ Industry jargon frequency
├─ Success descriptions patterns
└─ Trigger word analysis

#### OBJECTION LANGUAGE MAP:
| Objection Type | Frequency | Exact Variations | What Worked |
|----------------|-----------|------------------|-------------|
| Price          | X/10      | [List all variations] | [Solutions] |
| Timing         | X/10      | [List all variations] | [Solutions] |
| Authority      | X/10      | [List all variations] | [Solutions] |
| Trust          | X/10      | [List all variations] | [Solutions] |
| Feature Fit    | X/10      | [List all variations] | [Solutions] |

#### BUYING SIGNAL PATTERNS:
├─ Most common readiness phrases
├─ Interest escalation language
├─ Urgency expressions
└─ Commitment indicators

═══════════════════════════════════════════════════════════════════════

### C. CONVERSION PSYCHOLOGY PATTERNS

#### TIPPING POINTS ANALYSIS:
├─ Common breakthrough moments
├─ Phrases that create shifts
├─ Questions that unlock commitment
└─ Stories with highest impact

#### TRUST BUILDER PATTERNS:
├─ What creates credibility by segment
├─ Detail preferences by segment
├─ Logic vs emotion by segment
└─ Safety needs by segment

#### URGENCY TRIGGER MAP:
├─ External pressures that work
├─ Internal motivations that drive action
├─ Competitive dynamics that matter
└─ Timeline factors that convert

═══════════════════════════════════════════════════════════════════════

### D. STRATEGIC RECOMMENDATIONS

#### AWARENESS STAGE PRIORITIES:
├─ Which stage has highest volume: [Problem/Solution/Product]
├─ Which stage has highest conversion rate: [%]
├─ Quick wins (Product Aware) vs education plays (Problem Aware)
└─ Resource allocation by ROI potential

#### THE INTEREST SPECTRUM™ MOVEMENT:
Map how to move prospects through awareness stages:

PROBLEM → SOLUTION MOVEMENT:
├─ Key educational pieces needed
├─ Biggest misconceptions to address
├─ Success stories that resonate
└─ Timeline: 3-5 touches over 48-72 hours

SOLUTION → PRODUCT MOVEMENT:
├─ Differentiation points that matter
├─ Trust builders required
├─ Comparison tools needed
└─ Timeline: 2-3 touches over 24-48 hours

PRODUCT → CONVICTED MOVEMENT:
├─ Final objections to handle
├─ Urgency creators that work
├─ Risk reversals needed
└─ Timeline: 1-2 touches in 24 hours

#### CONTENT CREATION PRIORITIES:

IMMEDIATE (Week 1):
├─ Problem Aware: Industry transformation video
├─ Solution Aware: Comparison guide
├─ Product Aware: Implementation timeline
└─ All stages: Urgency-based incentive

SECONDARY (Week 2):
├─ Problem Aware: Cost calculator
├─ Solution Aware: ROI case studies
├─ Product Aware: Success guarantee
└─ All stages: Personalized video library

ONGOING:
├─ Segment-specific email sequences
├─ Trust-building assets per objection
├─ Success story library by {{TARGET_DESCRIPTOR}} type
└─ FAQ videos addressing top concerns

═══════════════════════════════════════════════════════════════════════

### E. IMPLEMENTATION ROADMAP

#### SUCCESS METRICS:
├─ Baseline metrics by segment
├─ Realistic improvement targets
├─ Leading indicators to track
└─ Testing recommendations

#### TESTING PRIORITIES:
├─ A/B tests to run first
├─ Metrics to track
├─ Hypotheses to validate
└─ Timeline for testing

═══════════════════════════════════════════════════════════════════════

### F. OUTPUT DELIVERABLES

Create the following formatted sections:

#### 1. EXECUTIVE SUMMARY
- Awareness stage distribution (% in each stage)
- Key patterns by awareness level
- Highest-impact opportunities by stage
- Critical success factors for spectrum movement

#### 2. DETAILED AWARENESS STAGE PROFILES
- Complete Problem Aware profile with examples
- Complete Solution Aware profile with examples
- Complete Product Aware profile with examples
- Specific descriptors for each prospect

#### 3. OBJECTION MAP BY AWARENESS STAGE
| Stage | Common Objections | Root Cause | What Works | Script |
|-------|------------------|------------|------------|--------|
| Problem Aware | [List] | [Analysis] | [Solutions] | [Words] |
| Solution Aware | [List] | [Analysis] | [Solutions] | [Words] |
| Product Aware | [List] | [Analysis] | [Solutions] | [Words] |

#### 4. LANGUAGE BANK BY AWARENESS STAGE
PROBLEM AWARE LANGUAGE:
- Pain articulation phrases (10+)
- Education hooks that work
- Soft CTAs that convert

SOLUTION AWARE LANGUAGE:
- Comparison phrases they use
- Trust-building language
- Differentiation hooks

PRODUCT AWARE LANGUAGE:
- Urgency expressions
- Commitment signals
- Action-oriented CTAs

#### 5. PRE-CALL NURTURE SEQUENCES
PROBLEM AWARE (5-7 touches):
- Complete email sequence with subject lines
- Content pieces needed
- Timing and triggers

SOLUTION AWARE (4-5 touches):
- Complete email sequence with subject lines
- Comparison assets needed
- Trust builders required

PRODUCT AWARE (2-3 touches):
- Complete email sequence with subject lines
- Urgency drivers
- Final friction removers

#### 6. SPECTRUM MOVEMENT PLAYBOOK
- Metrics to track movement between stages
- Content that creates biggest jumps
- Optimal timing between touches
- Personalization strategies by stage

#### 7. TESTING AND OPTIMIZATION FRAMEWORK
- A/B tests by awareness stage
- Success metrics for spectrum movement
- 30-day optimization roadmap
- Scale-up plan post-validation

Save complete analysis as:
`{{OUTPUT_PATH}}/batch_[X]_complete_analysis.md`

Save executive summary as:
`{{OUTPUT_PATH}}/batch_[X]_summary.md`

#### STEP 5: Update Master Analysis File
Append your batch summary to: `{{OUTPUT_PATH}}/{{MASTER_ANALYSIS_FILE}}`

## CRITICAL REQUIREMENTS:
- Sub-agents must address EVERY subsection of the template
- Use extensive direct quotes throughout
- Create actionable, specific recommendations
- Maintain all formatting exactly as shown
- Generate all 7 output deliverables

## QUALITY CHECKS:
Before finalizing, verify:
- [ ] All transcripts analyzed with complete template
- [ ] Every subsection addressed (or marked "Not evident")
- [ ] Direct quotes used extensively
- [ ] 3-5 distinct segments identified
- [ ] All 7 deliverables created
- [ ] Actionable recommendations provided
- [ ] Testing framework included

## TRANSCRIPT MAPPING BY BATCH

{{TRANSCRIPT_BATCH_MAPPING}}

## USAGE INSTRUCTIONS

To analyze a specific batch, instruct the orchestrator agent:

"Read the instructions in CLAUDE.md and analyze Batch [X]: Transcripts [Y-Z]"

For example:
- "Read the instructions in CLAUDE.md and analyze Batch 3: Transcripts 21-30"
- "Read the instructions in CLAUDE.md and analyze Batch 7: Transcripts 61-70"

The orchestrator will automatically:
1. Identify the correct 10 transcript files for that batch
2. Launch 10 sub-agents with complete forensic analysis instructions
3. Compile individual analyses maintaining all formatting
4. Synthesize patterns to create segments and nurture strategies
5. Generate all 7 required deliverables
6. Update the master analysis file

## FINAL COMPILATION

After all batches are complete, create a final master analysis that:

1. **AWARENESS STAGE DISTRIBUTION**
   - Overall breakdown: X% Problem Aware, Y% Solution Aware, Z% Product Aware
   - Stage distribution trends over time ({{DATE_RANGE}})
   - Conversion rates by awareness stage
   - Average spectrum movement achieved

2. **COMPREHENSIVE AWARENESS PROFILES**
   - Master Problem Aware profile with all variations
   - Master Solution Aware profile with all variations
   - Master Product Aware profile with all variations
   - Complete language bank for each stage

3. **SPECTRUM MOVEMENT PLAYBOOK**
   - Proven content pieces that move Problem → Solution
   - Proven content pieces that move Solution → Product
   - Proven content pieces that move Product → Convicted
   - Optimal timing and sequence for each transition

4. **MASTER NURTURE CAMPAIGN TEMPLATES**
   - Problem Aware: 5-7 touch sequence with all content
   - Solution Aware: 4-5 touch sequence with all content
   - Product Aware: 2-3 touch sequence with all content
   - Dynamic personalization variables identified

5. **OBJECTION HANDLING BY STAGE**
   - Complete objection scripts for Problem Aware prospects
   - Complete objection scripts for Solution Aware prospects
   - Complete objection scripts for Product Aware prospects
   - Stage-specific trust builders and proof points

6. **IMPLEMENTATION ROADMAP**
   - Week 1: Quick wins for Product Aware prospects
   - Week 2-3: Solution Aware optimization
   - Week 4+: Problem Aware education system
   - Success metrics and tracking dashboard

7. **TESTING & OPTIMIZATION FRAMEWORK**
   - 30 A/B tests prioritized by impact
   - Spectrum movement tracking system
   - Personalization opportunities by stage
   - Scale-up plan once validated

Save as: `{{OUTPUT_PATH}}/{{FINAL_ANALYSIS_FILE}}`