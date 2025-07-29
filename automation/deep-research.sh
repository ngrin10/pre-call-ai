#!/bin/bash

# 🎯 SCALESTREAM Deep Research Automation
# Extracts content from client files and feeds to competitive analysis

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

CLIENT_NAME="$1"

if [ -z "$CLIENT_NAME" ]; then
    echo -e "${RED}Error: Client name required${NC}"
    echo "Usage: ./deep-research.sh <client-name>"
    exit 1
fi

CLIENT_DIR="./data/clients/$CLIENT_NAME"
RESEARCH_DIR="$CLIENT_DIR/research"
PROMPT_FILE="./prompts/deep-research-competitive-analysis.md"

# Create research directory
mkdir -p "$RESEARCH_DIR"

echo -e "${BLUE}🔍 Preparing deep research for: $CLIENT_NAME${NC}"

# Function to extract content safely
extract_content() {
    local file_path="$1"
    if [ -f "$file_path" ]; then
        echo "=== CONTENT FROM: $file_path ==="
        cat "$file_path"
        echo ""
        echo "=== END OF: $file_path ==="
        echo ""
    else
        echo "=== FILE NOT FOUND: $file_path ==="
        echo "No content available"
        echo "=== END OF: $file_path ==="
        echo ""
    fi
}

# Create comprehensive research input
cat > "$RESEARCH_DIR/research-input.md" << EOF
# Deep Research Input for $CLIENT_NAME

## Business Context
$(extract_content "$CLIENT_DIR/client-brief.md")

## Sales Transcripts
$(extract_content "$CLIENT_DIR/transcripts/batch-1.md")
$(extract_content "$CLIENT_DIR/transcripts/batch-2.md")
$(extract_content "$CLIENT_DIR/transcripts/batch-3.md")

## Analysis Results
$(extract_content "$CLIENT_DIR/analysis/segment-synthesis.md")

## Current Marketing Materials
$(extract_content "$CLIENT_DIR/resources/marketing-materials.md")

## Strategic Insights
$(extract_content "$CLIENT_DIR/onboarding-insights.md")
EOF

# Create the research prompt with client data
cat > "$RESEARCH_DIR/research-prompt.md" << EOF
# Deep Research Request for $CLIENT_NAME

## Instructions
Use the deep research prompt template and analyze the following client data:

$(cat "$PROMPT_FILE")

## Client Data for Analysis
$(cat "$RESEARCH_DIR/research-input.md")
EOF

echo -e "${GREEN}✅ Research files prepared${NC}"
echo -e "${YELLOW}Files created:${NC}"
echo "  📄 $RESEARCH_DIR/research-input.md (all client data)"
echo "  📄 $RESEARCH_DIR/research-prompt.md (ready for AI)"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. Copy research-prompt.md content to Claude/GPT"
echo "2. Run the deep research analysis"
echo "3. Save results to $RESEARCH_DIR/competitive-analysis-results.md"
echo ""
echo -e "${GREEN}🎯 Ready for deep research!${NC}" 