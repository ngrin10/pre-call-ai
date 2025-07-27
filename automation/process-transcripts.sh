#!/bin/bash

# 🎯 SCALESTREAM Transcript Processing Automation
# Processes transcripts in batches of 5 with forensic analysis

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration
BATCH_SIZE=5
CLIENT_NAME="$1"
BATCH_NUMBER="${2:-1}"

# Validate inputs
if [ -z "$CLIENT_NAME" ]; then
    echo -e "${RED}Error: Client name required${NC}"
    echo "Usage: ./process-transcripts.sh <client-name> [batch-number]"
    exit 1
fi

# Set paths
CLIENT_DIR="./data/clients/$CLIENT_NAME"
TRANSCRIPT_DIR="$CLIENT_DIR/transcripts"
ANALYSIS_DIR="$CLIENT_DIR/analysis"
BATCH_FILE="$TRANSCRIPT_DIR/batch-$BATCH_NUMBER.md"
CLAUDE_MD="$ANALYSIS_DIR/CLAUDE.md"

# Create directories if needed
mkdir -p "$ANALYSIS_DIR"

# Function to send terminal bell notification
notify_complete() {
    echo -e "\a" # Terminal bell
    echo -e "${GREEN}✅ Batch $BATCH_NUMBER processing complete!${NC}"
}

# Function to check prerequisites
check_prerequisites() {
    echo -e "${BLUE}🔍 Checking prerequisites...${NC}"
    
    # Check if client directory exists
    if [ ! -d "$CLIENT_DIR" ]; then
        echo -e "${RED}❌ Client directory not found: $CLIENT_DIR${NC}"
        echo "Run: mkdir -p $CLIENT_DIR/transcripts"
        exit 1
    fi
    
    # Check if batch file exists
    if [ ! -f "$BATCH_FILE" ]; then
        echo -e "${RED}❌ Batch file not found: $BATCH_FILE${NC}"
        echo "Please create the batch file with transcripts first"
        exit 1
    fi
    
    # Check if client brief exists
    if [ ! -f "$CLIENT_DIR/client-brief.md" ]; then
        echo -e "${YELLOW}⚠️  Warning: client-brief.md not found${NC}"
        echo "Strategic context may be missing"
    fi
    
    # Check if CLAUDE.md exists
    if [ -f "$CLAUDE_MD" ]; then
        echo -e "${GREEN}✅ Custom CLAUDE.md found${NC}"
    else
        echo -e "${YELLOW}⚠️  No custom CLAUDE.md - using generic analysis${NC}"
        echo "Run: ./automation/quick-commands.sh setup $CLIENT_NAME"
    fi
    
    echo -e "${GREEN}✅ Prerequisites checked${NC}"
}

# Function to extract business context
extract_business_context() {
    echo -e "${BLUE}📋 Extracting business context...${NC}"
    
    if [ -f "$CLIENT_DIR/client-brief.md" ]; then
        BUSINESS_CONTEXT=$(cat "$CLIENT_DIR/client-brief.md")
        echo -e "${GREEN}✅ Business context loaded${NC}"
    else
        BUSINESS_CONTEXT="No strategic context available"
        echo -e "${YELLOW}⚠️  No business context found${NC}"
    fi
}

# Function to process transcript batch
process_batch() {
    echo -e "${BLUE}🔄 Processing batch $BATCH_NUMBER...${NC}"
    
    # Check if custom CLAUDE.md exists
    if [ -f "$CLAUDE_MD" ]; then
        # Use custom CLAUDE.md instructions
        cat > "$ANALYSIS_DIR/batch-$BATCH_NUMBER-prompt.md" << EOF
# Forensic Analysis Request - $CLIENT_NAME Batch $BATCH_NUMBER

## Instructions
Please refer to the custom analysis instructions in:
$CLAUDE_MD

Analyze Batch $BATCH_NUMBER: Transcripts $((($BATCH_NUMBER-1)*5+1))-$(($BATCH_NUMBER*5))

## Business Context
$BUSINESS_CONTEXT

## Transcripts
$(cat "$BATCH_FILE")
EOF
    else
        # Use generic prompt
        cat > "$ANALYSIS_DIR/batch-$BATCH_NUMBER-prompt.md" << EOF
# Forensic Analysis Request - $CLIENT_NAME Batch $BATCH_NUMBER

## Business Context
$BUSINESS_CONTEXT

## Instructions
Analyze these $BATCH_SIZE transcripts using the V3.0 forensic analysis framework:

1. Extract awareness level segments (Problem/Solution/Product Aware)
2. Identify specific pain points and objections
3. Find exact language patterns and quotes
4. Calculate percentage distribution
5. Provide actionable insights for nurture sequences

## Transcripts
$(cat "$BATCH_FILE")

## Required Output Format
- Awareness distribution with percentages
- 3+ specific quotes per segment
- Key objection patterns
- Recommended messaging angles
- Competitive insights if mentioned
EOF
    fi
    
    echo -e "${GREEN}✅ Analysis prompt created${NC}"
    echo -e "${YELLOW}📝 Ready for Claude analysis${NC}"
}

# Function to create analysis summary
create_summary() {
    echo -e "${BLUE}📊 Creating analysis summary...${NC}"
    
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    
    cat > "$ANALYSIS_DIR/batch-$BATCH_NUMBER-summary.md" << EOF
# Batch $BATCH_NUMBER Analysis Summary

## Metadata
- Client: $CLIENT_NAME
- Batch: $BATCH_NUMBER
- Processed: $TIMESTAMP
- Transcripts: $BATCH_SIZE
- Status: Ready for Claude analysis

## Next Steps
1. Copy the prompt from batch-$BATCH_NUMBER-prompt.md
2. Run in Claude with forensic analysis project
3. Save results to batch-$BATCH_NUMBER-results.md
4. Run segment synthesis after all batches complete

## Quality Checklist
- [ ] Business context included
- [ ] All transcripts have metadata
- [ ] Proper formatting verified
- [ ] Ready for forensic analysis
EOF
    
    echo -e "${GREEN}✅ Summary created${NC}"
}

# Main execution
echo -e "${BLUE}🚀 SCALESTREAM Transcript Processor${NC}"
echo -e "Client: ${YELLOW}$CLIENT_NAME${NC}"
echo -e "Batch: ${YELLOW}$BATCH_NUMBER${NC}"
echo ""

# Run checks
check_prerequisites

# Extract context
extract_business_context

# Process batch
process_batch

# Create summary
create_summary

# Send notification
notify_complete

# Show next steps
echo ""
echo -e "${BLUE}📋 Next Steps:${NC}"
echo "1. Open: $ANALYSIS_DIR/batch-$BATCH_NUMBER-prompt.md"
echo "2. Copy content to Claude with forensic analysis project"
echo "3. Save results to: $ANALYSIS_DIR/batch-$BATCH_NUMBER-results.md"
echo "4. Run next batch: ./process-transcripts.sh $CLIENT_NAME $((BATCH_NUMBER + 1))"
echo ""
echo -e "${GREEN}🎯 Batch $BATCH_NUMBER ready for analysis!${NC}"