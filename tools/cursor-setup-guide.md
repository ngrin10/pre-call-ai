# 🔗 Cursor + Claude Integration Setup Guide

**How to link everything up for smooth operation with the V3.0 SCALESTREAM PRE-CALL SYSTEM™**

---

## 🚀 **STEP 1: Cursor Project Configuration** (2 minutes)

### **Verify Cursor Rules Are Active**
1. **Check if `.cursor/rules.md` exists** in your project root ✅
2. **Open Cursor settings** (Cmd/Ctrl + ,)
3. **Verify "Use .cursor folder"** is enabled
4. **Test the rules**: Type `"Show me the V3.0 methodology"` in chat

### **Configure Cursor AI Settings**
```json
// In Cursor settings, ensure:
{
  "cursor.general.enableCodeGeneration": true,
  "cursor.general.enableFileSearch": true,
  "cursor.general.enableContextualChat": true
}
```

---

## 🧠 **STEP 2: Claude Project Setup** (5 minutes)

### **Create Dedicated Claude Project**
1. **Go to Claude.ai** → Create New Project
2. **Name**: `"[Client Name] Pre-Call System V3.0"`
3. **Description**: `"V3.0 SCALESTREAM analysis and content generation"`

### **Upload Project Knowledge**
**Essential Files to Upload:**
- `prompts/forensic-analysis.md` (Master analysis prompt)
- `sops/v3-methodology.md` (Complete methodology)
- `templates/awareness-segments.md` (Content templates)
- `tools/onboarding-quality-gates.md` (Quality standards)
- `examples/sample-analysis.md` (Quality benchmark)

### **Set Project Instructions**
**Copy this into Claude Project Instructions:**
```markdown
You are an expert in the V3.0 SCALESTREAM PRE-CALL SYSTEM™. 

CORE MISSION: Move prospects up the awareness spectrum from Curious → General Interest → Serious → Convicted through forensic analysis and strategic content.

ALWAYS:
- Use the forensic analysis prompt from project knowledge
- Reference the V3.0 methodology for all decisions
- Require specific transcript quotes as evidence
- Focus on awareness spectrum movement
- Follow the quality gates for validation

NEVER:
- Create generic segments without specific quotes
- Skip business context integration
- Use fake urgency or pressure tactics
- Proceed without proper validation

When analyzing, always ask: "What awareness level are they at, and how do we move them up 2-3 levels?"
```

---

## 🔄 **STEP 3: Workflow Integration** (3 minutes)

### **Cursor → Claude Workflow**

#### **Phase 1: Project Setup**
1. **In Cursor**: Type `"New client [Name] onboarding"`
2. **Cursor creates**: Folder structure and templates
3. **You fill**: Client materials and onboarding insights
4. **Quality check**: Cursor validates readiness

#### **Phase 2: Analysis**
1. **In Cursor**: Type `"Ready for analysis [Client]"`
2. **Cursor prepares**: Strategic context and hypothesis
3. **Copy to Claude**: Transcripts + context for forensic analysis
4. **Claude analyzes**: Using V3.0 methodology and business context

#### **Phase 3: Content Creation**
1. **Claude generates**: Awareness-specific content based on analysis
2. **Copy to Cursor**: For organization and deployment prep
3. **Cursor validates**: Content quality and spectrum movement
4. **Final output**: Organized implementation package

### **File Organization Workflow**
```
CURSOR WORKSPACE:
/0-INBOX/[client]/ → Data collection and validation
/1-ANALYSIS/[client]/ → Analysis results and insights  
/2-CONTENT-GEN/[client]/ → Generated content and deployment

CLAUDE PROJECT:
Project Knowledge → All methodology and templates
Chat History → Analysis and content generation
```

---

## 🎯 **STEP 4: Command Integration** (1 minute)

### **Key Cursor Commands That Trigger Claude Work**

#### **Setup Commands**
- `"New client [name] onboarding"` → Creates structure, guides data collection
- `"Validate [client] readiness"` → Checks quality gates before analysis

#### **Analysis Commands**  
- `"Ready for analysis [client]"` → Prepares context for Claude analysis
- `"Create strategic context summary"` → Formats business insights for Claude

#### **Content Commands**
- `"Generate content brief for [client]"` → Creates strategy for Claude content generation
- `"Validate content quality"` → Checks Claude output against V3.0 standards

### **Claude Commands for Analysis**
```markdown
# Copy this format into Claude:

"Analyze [Client] transcripts using the forensic analysis prompt with this strategic context:

BUSINESS CONTEXT:
- Current show rate: X%
- Main competitors: [List]
- Unique differentiator: [Key advantage]
- Primary objection: [What they currently hear]

HYPOTHESIS TO TEST:
- Expected Problem Aware: X% (evidence: [insight])
- Expected Solution Aware: X% (evidence: [insight])
- Expected Product Aware: X% (evidence: [insight])

TRANSCRIPTS: [Paste transcripts with metadata]

Use the complete forensic analysis framework and provide evidence for all claims."
```

---

## ⚡ **STEP 5: Quick Testing** (2 minutes)

### **Test the Integration**
1. **In Cursor**: `"New client Test Corp onboarding"`
2. **Verify**: Folder structure created with templates
3. **Add sample data**: Use provided transcript template
4. **In Cursor**: `"Ready for analysis Test Corp"`
5. **Check**: Strategic context preparation works
6. **Copy to Claude**: Test the analysis format
7. **Verify**: Claude follows V3.0 methodology

### **Expected Cursor Responses**
✅ **Good Response**: "I'll create the onboarding structure for Test Corp. Based on the quality gates, you'll need..."

❌ **Poor Response**: Generic folder creation without methodology reference

### **Expected Claude Responses**
✅ **Good Response**: References V3.0 methodology, asks for business context, uses forensic analysis framework

❌ **Poor Response**: Generic analysis without awareness spectrum focus

---

## 🔧 **STEP 6: Optimization Settings** (3 minutes)

### **Cursor Performance Optimization**
```json
// Add to Cursor settings for better performance:
{
  "cursor.general.maxFileSize": 10000000,
  "cursor.general.enableAutoCompletion": true,
  "cursor.general.contextWindowSize": "large"
}
```

### **Claude Project Optimization**
- **Enable "Long conversations"** in Claude settings
- **Use "Continue conversation"** for multi-part analysis
- **Save important prompts** as Project artifacts
- **Organize conversations** by client name

### **File Organization Tips**
- **Keep active projects** in `/clients/active/`
- **Archive completed** in `/clients/completed/`
- **Use consistent naming**: `[client-name]-[date]-[type]`
- **Version control**: Save iterations for learning

---

## 📊 **STEP 7: Quality Monitoring** (2 minutes)

### **Built-in Quality Checks**

#### **Cursor Validation**
- Automatically checks quality gates
- Validates file structure and completeness
- Ensures methodology compliance
- Flags missing requirements

#### **Claude Validation**
- References project knowledge for consistency
- Requires evidence for all segment claims
- Follows awareness spectrum framework
- Maintains quality standards

### **Manual Quality Checks**
**Before Analysis:**
- [ ] 15+ transcripts with complete metadata
- [ ] Strategic onboarding insights captured
- [ ] Business context documented
- [ ] Competitive intelligence gathered

**After Analysis:**
- [ ] Each segment has specific transcript quotes
- [ ] Awareness percentages are realistic
- [ ] Business model alignment confirmed
- [ ] Actionable content strategy provided

**After Content:**
- [ ] Uses prospect's exact language
- [ ] Focuses on spectrum movement
- [ ] Includes appropriate proof points
- [ ] Follows sequence structures

---

## 🎉 **STEP 8: Success Validation** (1 minute)

### **You'll Know It's Working When:**

#### **Cursor Integration Success**
✅ Commands reference V3.0 methodology automatically  
✅ Quality gates prevent poor inputs  
✅ File organization is consistent and logical  
✅ Context preparation is strategic and complete  

#### **Claude Integration Success**
✅ Analysis follows forensic analysis framework exactly  
✅ Segments are evidence-based with specific quotes  
✅ Content generation matches awareness levels  
✅ Output quality is consistently high  

#### **Overall System Success**
✅ 60%+ time savings on analysis  
✅ Higher quality, more strategic output  
✅ Consistent methodology application  
✅ Measurable client results improvement  

---

## 🆘 **TROUBLESHOOTING**

### **Common Issues & Fixes**

#### **Cursor Not Following Rules**
- **Issue**: Generic responses, not methodology-aware
- **Fix**: Check `.cursor/rules.md` exists and restart Cursor

#### **Claude Not Using Project Knowledge**
- **Issue**: Generic analysis, ignoring methodology
- **Fix**: Reference specific files in prompts: "Use the forensic analysis prompt from project knowledge"

#### **Poor Quality Output**
- **Issue**: Missing quotes, unrealistic percentages
- **Fix**: Use quality validation commands, enforce evidence requirements

#### **File Organization Problems**
- **Issue**: Inconsistent structure, lost files
- **Fix**: Use Cursor commands for folder creation, follow naming conventions

### **Emergency Reset**
If something breaks:
1. **Close Cursor** and reopen project
2. **Check `.cursor/rules.md`** is properly formatted
3. **Verify Claude project** has all knowledge files
4. **Test with simple command**: `"Show me the V3.0 methodology"`

---

## 🚀 **READY TO GO!**

**Your system is now fully integrated. Test it with:**

```bash
# In Cursor:
"New client ABC Corp onboarding"

# Follow the prompts, then:
"Ready for analysis ABC Corp"

# Copy the context to Claude and run analysis
```

**Expected outcome**: Smooth, methodology-driven workflow that produces high-quality, evidence-based analysis and content! 🎯 