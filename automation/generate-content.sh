#!/bin/bash

# 🎯 SCALESTREAM Content Generation Automation
# Generates awareness-specific content based on analysis results

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration
CLIENT_NAME="$1"
AWARENESS_LEVEL="$2"

# Validate inputs
if [ -z "$CLIENT_NAME" ] || [ -z "$AWARENESS_LEVEL" ]; then
    echo -e "${RED}Error: Missing required parameters${NC}"
    echo "Usage: ./generate-content.sh <client-name> <awareness-level>"
    echo "Awareness levels: problem-aware, solution-aware, product-aware"
    exit 1
fi

# Validate awareness level
if [[ ! "$AWARENESS_LEVEL" =~ ^(problem-aware|solution-aware|product-aware)$ ]]; then
    echo -e "${RED}Error: Invalid awareness level${NC}"
    echo "Valid options: problem-aware, solution-aware, product-aware"
    exit 1
fi

# Set paths
CLIENT_DIR="./data/clients/$CLIENT_NAME"
ANALYSIS_DIR="$CLIENT_DIR/analysis"
CONTENT_DIR="$CLIENT_DIR/content/$AWARENESS_LEVEL"
SEGMENT_FILE="$ANALYSIS_DIR/segment-synthesis.md"

# Create directories
mkdir -p "$CONTENT_DIR"

# Function to send notification
notify_complete() {
    echo -e "\a" # Terminal bell
    echo -e "${GREEN}✅ $AWARENESS_LEVEL content generation complete!${NC}"
}

# Function to check prerequisites
check_prerequisites() {
    echo -e "${BLUE}🔍 Checking prerequisites...${NC}"
    
    if [ ! -f "$SEGMENT_FILE" ]; then
        echo -e "${RED}❌ Segment synthesis not found${NC}"
        echo "Please run segment synthesis first"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Prerequisites checked${NC}"
}

# Function to get sequence length by awareness
get_sequence_length() {
    case $AWARENESS_LEVEL in
        "problem-aware")
            SEQUENCE_LENGTH=7
            GOAL="Move from Curious → General Interest"
            ;;
        "solution-aware")
            SEQUENCE_LENGTH=5
            GOAL="Move from General Interest → Serious"
            ;;
        "product-aware")
            SEQUENCE_LENGTH=3
            GOAL="Move from Serious → Convicted"
            ;;
    esac
}

# Function to create content prompt
create_content_prompt() {
    echo -e "${BLUE}📝 Creating content generation prompt...${NC}"
    
    get_sequence_length
    
    cat > "$CONTENT_DIR/content-prompt.md" << EOF
# Content Generation Request - $CLIENT_NAME

## Target Segment: ${AWARENESS_LEVEL}
## Goal: $GOAL
## Sequence Length: $SEQUENCE_LENGTH emails

## Segment Profile
$(grep -A 20 "$AWARENESS_LEVEL" "$SEGMENT_FILE" || echo "Segment data not found")

## Content Requirements

### Email Sequence ($SEQUENCE_LENGTH emails)
Create a ${SEQUENCE_LENGTH}-email nurture sequence that:
1. Uses exact language from transcript quotes
2. Addresses specific objections identified
3. Moves prospects from current state to next awareness level
4. Includes appropriate proof points for this awareness level
5. Follows V3.0 methodology messaging framework

### SMS Flow (3-5 messages)
Create natural SMS conversation flow that:
1. Feels conversational, not promotional
2. References specific pain points
3. Encourages engagement
4. Complements email sequence timing

### Subject Lines
Provide 3 variations for each email:
- A/B test version focused on curiosity
- A/B test version focused on benefit
- Backup version

### Trust Assets Needed
List 2-3 trust assets that would support this sequence:
- Type of asset (case study, guide, checklist, etc.)
- Key points to include
- How it supports the awareness journey

## Output Format
Structure the content clearly with:
- Email 1: [Subject Line] - [Primary Purpose]
- Email 2: [Subject Line] - [Primary Purpose]
- etc.

Include timing recommendations between touches.
EOF
    
    echo -e "${GREEN}✅ Content prompt created${NC}"
}

# Function to create content templates
create_templates() {
    echo -e "${BLUE}📄 Creating content templates...${NC}"
    
    # Email sequence template
    cat > "$CONTENT_DIR/email-sequence.md" << EOF
# $AWARENESS_LEVEL Email Sequence - $CLIENT_NAME

## Sequence Overview
- **Awareness Level**: $AWARENESS_LEVEL
- **Number of Emails**: $SEQUENCE_LENGTH
- **Goal**: $GOAL
- **Timing**: [To be determined based on analysis]

## Email Templates

### Email 1: [HOOK/SUBJECT]
**Subject Line Options:**
- A: [Curiosity-focused]
- B: [Benefit-focused]
- C: [Backup option]

**Send Time**: Immediately after booking

**Body**:
[Email content to be generated]

---

### Email 2: [HOOK/SUBJECT]
**Subject Line Options:**
- A: [Curiosity-focused]
- B: [Benefit-focused]
- C: [Backup option]

**Send Time**: [X hours/days after Email 1]

**Body**:
[Email content to be generated]

---

[Continue pattern for all emails]

## Performance Tracking
- [ ] Open rates by subject line
- [ ] Click rates by email
- [ ] Response rates
- [ ] Show rate impact
EOF

    # SMS flow template
    cat > "$CONTENT_DIR/sms-flow.md" << EOF
# $AWARENESS_LEVEL SMS Flow - $CLIENT_NAME

## Flow Overview
- **Messages**: 3-5 conversational texts
- **Timing**: Coordinated with email sequence
- **Style**: Natural, conversational, helpful

## SMS Templates

### SMS 1: Opening Connection
**Send Time**: [When to send]
**Message**: 
[Conversational opener]

**If Response**: [Follow-up path]
**If No Response**: Continue to SMS 2

---

### SMS 2: Value Touch
**Send Time**: [When to send]
**Message**:
[Value-focused message]

**If Response**: [Follow-up path]
**If No Response**: Continue to SMS 3

---

[Continue pattern]

## Response Handling
- Positive response → [Action]
- Question → [Action]
- Objection → [Action]
- Request reschedule → [Action]
EOF

    echo -e "${GREEN}✅ Templates created${NC}"
}

# Function to create tracking setup
create_tracking() {
    echo -e "${BLUE}📊 Setting up tracking structure...${NC}"
    
    cat > "$CONTENT_DIR/metrics-tracking.md" << EOF
# $AWARENESS_LEVEL Content Metrics - $CLIENT_NAME

## Baseline Metrics (Pre-Implementation)
- Show Rate: [X]%
- Email Open Rate: [X]%
- Response Rate: [X]%

## Target Metrics
- Show Rate: [X]%
- Email Open Rate: [X]%
- Response Rate: [X]%

## Tracking Schedule
- Week 1: [Metrics to track]
- Week 2: [Metrics to track]
- Week 3: [Metrics to track]
- Month 1 Summary: [Analysis points]

## A/B Tests Planned
1. Subject Line Test 1: [Description]
2. Subject Line Test 2: [Description]
3. Content Test 1: [Description]

## Optimization Log
Date | Change | Result | Decision
-----|--------|--------|----------
[Date] | [What changed] | [Impact] | [Keep/Revert]
EOF

    echo -e "${GREEN}✅ Tracking structure created${NC}"
}

# Main execution
echo -e "${BLUE}🚀 SCALESTREAM Content Generator${NC}"
echo -e "Client: ${YELLOW}$CLIENT_NAME${NC}"
echo -e "Awareness Level: ${YELLOW}$AWARENESS_LEVEL${NC}"
echo ""

# Run checks
check_prerequisites

# Create content assets
create_content_prompt
create_templates
create_tracking

# Send notification
notify_complete

# Show next steps
echo ""
echo -e "${BLUE}📋 Next Steps:${NC}"
echo "1. Open: $CONTENT_DIR/content-prompt.md"
echo "2. Generate content in Claude using the prompt"
echo "3. Fill in templates with generated content"
echo "4. Review against quality checklist"
echo "5. Implement in platform (GHL, etc.)"
echo ""
echo -e "${GREEN}🎯 Ready to generate $AWARENESS_LEVEL content!${NC}"