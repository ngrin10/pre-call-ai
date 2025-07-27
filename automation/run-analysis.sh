#!/bin/bash

# 🎯 SCALESTREAM Complete Analysis Pipeline
# Orchestrates the entire analysis workflow with notifications

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Configuration
CLIENT_NAME="$1"
TOTAL_TRANSCRIPTS="${2:-15}"
BATCH_SIZE=5

# Validate inputs
if [ -z "$CLIENT_NAME" ]; then
    echo -e "${RED}Error: Client name required${NC}"
    echo "Usage: ./run-analysis.sh <client-name> [total-transcripts]"
    exit 1
fi

# Calculate batches needed
TOTAL_BATCHES=$((($TOTAL_TRANSCRIPTS + $BATCH_SIZE - 1) / $BATCH_SIZE))

# Set paths
CLIENT_DIR="./data/clients/$CLIENT_NAME"
ANALYSIS_DIR="$CLIENT_DIR/analysis"
LOG_FILE="$ANALYSIS_DIR/analysis-log.txt"

# Create directories
mkdir -p "$ANALYSIS_DIR"

# Function for major notifications
major_notify() {
    echo -e "\a\a\a" # Multiple bells
    sleep 0.5
    echo -e "\a\a" # More bells
}

# Function to log with timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Function to show progress bar
show_progress() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local completed=$((width * current / total))
    
    printf "\r${BLUE}Progress: [${NC}"
    printf "%${completed}s" | tr ' ' '█'
    printf "%$((width - completed))s" | tr ' ' '░'
    printf "${BLUE}] ${percentage}%% ${NC}"
}

# Function to run quality gates
run_quality_gates() {
    echo -e "${PURPLE}🔍 Running Quality Gates...${NC}"
    
    local checks_passed=true
    
    # Check 1: Transcripts exist
    if [ ! -d "$CLIENT_DIR/transcripts" ]; then
        echo -e "${RED}❌ No transcripts directory found${NC}"
        checks_passed=false
    fi
    
    # Check 2: Client brief exists
    if [ ! -f "$CLIENT_DIR/client-brief.md" ]; then
        echo -e "${YELLOW}⚠️  Warning: No client brief found${NC}"
        echo -e "${YELLOW}   Strategic context may be missing${NC}"
    fi
    
    # Check 3: Minimum transcript count
    transcript_count=$(find "$CLIENT_DIR/transcripts" -name "*.md" 2>/dev/null | wc -l)
    if [ $transcript_count -lt 15 ]; then
        echo -e "${RED}❌ Insufficient transcripts: $transcript_count found (need 15+)${NC}"
        checks_passed=false
    fi
    
    if [ "$checks_passed" = true ]; then
        echo -e "${GREEN}✅ All quality gates passed${NC}"
        return 0
    else
        echo -e "${RED}❌ Quality gates failed${NC}"
        return 1
    fi
}

# Function to process all batches
process_all_batches() {
    echo -e "${BLUE}📊 Processing $TOTAL_BATCHES batches...${NC}"
    
    for ((batch=1; batch<=TOTAL_BATCHES; batch++)); do
        show_progress $batch $TOTAL_BATCHES
        log_message "Processing batch $batch of $TOTAL_BATCHES"
        
        # Run transcript processor
        ./automation/process-transcripts.sh "$CLIENT_NAME" $batch
        
        # Simulate processing time
        sleep 2
    done
    
    echo "" # New line after progress bar
    echo -e "${GREEN}✅ All batches processed${NC}"
}

# Function to create synthesis prompt
create_synthesis() {
    echo -e "${BLUE}🔄 Creating segment synthesis...${NC}"
    
    cat > "$ANALYSIS_DIR/segment-synthesis-prompt.md" << EOF
# Segment Synthesis - $CLIENT_NAME

## Instructions
Synthesize all batch analyses into unified awareness segments:

1. Combine findings from all $TOTAL_BATCHES batches
2. Calculate overall awareness distribution percentages
3. Identify most common patterns and objections
4. Extract best quotes for each segment
5. Provide unified recommendations

## Batch Results to Synthesize
$(for ((i=1; i<=TOTAL_BATCHES; i++)); do
    echo "- Batch $i: $ANALYSIS_DIR/batch-$i-results.md"
done)

## Required Output
- Final awareness distribution (must = 100%)
- Unified segment profiles with best quotes
- Key patterns across all transcripts
- Priority recommendations for content
- Competitive insights summary
EOF
    
    log_message "Synthesis prompt created"
    echo -e "${GREEN}✅ Synthesis prompt ready${NC}"
}

# Function to generate final report
generate_report() {
    echo -e "${BLUE}📋 Generating analysis report...${NC}"
    
    cat > "$ANALYSIS_DIR/analysis-report.md" << EOF
# 📊 SCALESTREAM Analysis Report - $CLIENT_NAME

## Executive Summary
- **Date**: $(date '+%Y-%m-%d')
- **Transcripts Analyzed**: $TOTAL_TRANSCRIPTS
- **Batches Processed**: $TOTAL_BATCHES
- **Status**: Ready for content generation

## Awareness Distribution
- Problem Aware: [X]%
- Solution Aware: [X]%
- Product Aware: [X]%

## Key Findings
1. [Finding 1]
2. [Finding 2]
3. [Finding 3]

## Segment Profiles
### Problem Aware ([X]%)
- **Characteristics**: [Details]
- **Key Quote**: "[Quote]"
- **Recommended Approach**: [Strategy]

### Solution Aware ([X]%)
- **Characteristics**: [Details]
- **Key Quote**: "[Quote]"
- **Recommended Approach**: [Strategy]

### Product Aware ([X]%)
- **Characteristics**: [Details]
- **Key Quote**: "[Quote]"
- **Recommended Approach**: [Strategy]

## Next Steps
1. Generate content for each awareness level
2. Create trust assets based on findings
3. Implement in platform
4. Set up tracking

## Quality Validation
- [ ] All segments have supporting quotes
- [ ] Percentages add to 100%
- [ ] Business context integrated
- [ ] Actionable recommendations provided
EOF
    
    log_message "Analysis report generated"
    echo -e "${GREEN}✅ Report generated${NC}"
}

# Main execution
clear
echo -e "${PURPLE}╔═══════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║   🚀 SCALESTREAM ANALYSIS PIPELINE    ║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "Client: ${YELLOW}$CLIENT_NAME${NC}"
echo -e "Transcripts: ${YELLOW}$TOTAL_TRANSCRIPTS${NC}"
echo -e "Batches: ${YELLOW}$TOTAL_BATCHES${NC}"
echo ""

# Initialize log
log_message "Starting analysis pipeline for $CLIENT_NAME"

# Step 1: Quality Gates
if ! run_quality_gates; then
    echo -e "${RED}Analysis cannot proceed. Fix issues and try again.${NC}"
    exit 1
fi

# Step 2: Process Batches
process_all_batches

# Step 3: Create Synthesis
create_synthesis

# Step 4: Generate Report
generate_report

# Completion notification
major_notify
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    ✅ ANALYSIS PIPELINE COMPLETE!     ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""

# Show next steps
echo -e "${BLUE}📋 Immediate Next Steps:${NC}"
echo "1. Run batch analyses in Claude:"
for ((i=1; i<=TOTAL_BATCHES; i++)); do
    echo "   - $ANALYSIS_DIR/batch-$i-prompt.md"
done
echo ""
echo "2. Save results as:"
for ((i=1; i<=TOTAL_BATCHES; i++)); do
    echo "   - $ANALYSIS_DIR/batch-$i-results.md"
done
echo ""
echo "3. Run synthesis in Claude:"
echo "   - $ANALYSIS_DIR/segment-synthesis-prompt.md"
echo ""
echo "4. Generate content for each segment:"
echo "   ./automation/generate-content.sh $CLIENT_NAME problem-aware"
echo "   ./automation/generate-content.sh $CLIENT_NAME solution-aware"
echo "   ./automation/generate-content.sh $CLIENT_NAME product-aware"
echo ""

log_message "Pipeline completed successfully"
echo -e "${GREEN}🎯 Ready for Claude analysis!${NC}"