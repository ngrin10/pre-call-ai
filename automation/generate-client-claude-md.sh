#!/bin/bash

# Generate Client-Specific CLAUDE.md
# This script creates a customized CLAUDE.md file for each client based on their configuration

set -e

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if client name is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Client name required${NC}"
    echo "Usage: $0 <client-name>"
    echo "Example: $0 acme-corp"
    exit 1
fi

CLIENT_NAME=$1
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Paths
CLIENT_DIR="${PROJECT_ROOT}/data/clients/${CLIENT_NAME}"
CONFIG_FILE="${CLIENT_DIR}/client-config.yaml"
TEMPLATE_FILE="${PROJECT_ROOT}/prompts/01-forensic-analysis-system.md"
OUTPUT_FILE="${CLIENT_DIR}/analysis/CLAUDE.md"

# Check if client directory exists
if [ ! -d "$CLIENT_DIR" ]; then
    echo -e "${RED}Error: Client directory not found: $CLIENT_DIR${NC}"
    echo "Run './automation/quick-commands.sh new $CLIENT_NAME' first"
    exit 1
fi

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${YELLOW}Config file not found. Creating from template...${NC}"
    cp "${PROJECT_ROOT}/templates/client-config-template.yaml" "$CONFIG_FILE"
    echo -e "${GREEN}Created config file: $CONFIG_FILE${NC}"
    echo -e "${YELLOW}Please edit the config file with client-specific information, then run this script again.${NC}"
    exit 0
fi

# Create analysis directory if it doesn't exist
mkdir -p "${CLIENT_DIR}/analysis"

echo -e "${GREEN}Generating CLAUDE.md for ${CLIENT_NAME}...${NC}"

# Function to replace placeholders
replace_placeholders() {
    local input_file=$1
    local output_file=$2
    
    # Read the config file and extract values
    # This is a simplified approach - in production, use a proper YAML parser
    
    # Extract client name
    local client_display_name=$(grep -A1 "client_info:" "$CONFIG_FILE" | grep "name:" | sed 's/.*: "\(.*\)"/\1/')
    local business_desc=$(grep "description:" "$CONFIG_FILE" | head -1 | sed 's/.*: "\(.*\)"/\1/')
    local solution_category=$(grep "solution_category:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    local target_audience=$(grep "target_audience:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    local target_descriptor=$(grep "target_descriptor:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    
    # Extract paths
    local transcript_path=$(grep "transcript_path:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    local background_file=$(grep "background_file:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    local output_path=$(grep "output_path:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    
    # Extract metrics
    local current_stats=$(grep "current_stats:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    local volume_metrics=$(grep "volume_metrics:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    local pricing_info=$(grep "pricing_info:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    local sales_process=$(grep "sales_process:" "$CONFIG_FILE" | sed 's/.*: "\(.*\)"/\1/')
    
    # Extract transcript info
    local total_transcripts=$(grep "total:" "$CONFIG_FILE" | tail -1 | sed 's/.*: \([0-9]*\)/\1/')
    local batch_size=$(grep "batch_size:" "$CONFIG_FILE" | sed 's/.*: \([0-9]*\)/\1/')
    
    # Default batch size to 5 if not found
    if [ -z "$batch_size" ]; then
        batch_size=5
    fi
    
    # Generate batch list
    local batch_list=""
    local batch_count=$(( ($total_transcripts + $batch_size - 1) / $batch_size ))
    for (( i=1; i<=$batch_count; i++ )); do
        local start=$(( ($i-1)*$batch_size + 1 ))
        local end=$(( $i*$batch_size ))
        if [ $end -gt $total_transcripts ]; then
            end=$total_transcripts
        fi
        batch_list="${batch_list}- Batch $i: Transcripts $start-$end\n"
    done
    
    # Create temporary file for processing
    cp "$input_file" "${output_file}.tmp"
    
    # Extract more fields from config
    local problem_indicators=$(grep -A 5 "problem_aware:" "$CONFIG_FILE" | grep -A 3 "indicators:" | grep "- " | sed 's/^[ ]*- /- /' | tr '\n' '\n')
    local solution_needs=$(grep -A 5 "solution_aware:" "$CONFIG_FILE" | grep -A 2 "needs:" | grep "- " | sed 's/^[ ]*- /- /' | tr '\n' '\n')
    local competitors=$(grep -A 5 "main_competitors:" "$CONFIG_FILE" | grep "name:" | sed 's/.*name: "\(.*\)"/- \1/' | tr '\n' '\n')
    
    # Replace all placeholders
    sed -i '' "s|{{CLIENT_NAME}}|$client_display_name|g" "${output_file}.tmp"
    sed -i '' "s|{{BUSINESS_DESCRIPTION}}|$business_desc|g" "${output_file}.tmp"
    sed -i '' "s|{{SOLUTION_CATEGORY}}|$solution_category|g" "${output_file}.tmp"
    sed -i '' "s|{{TARGET_AUDIENCE}}|$target_audience|g" "${output_file}.tmp"
    sed -i '' "s|{{TARGET_DESCRIPTOR}}|$target_descriptor|g" "${output_file}.tmp"
    sed -i '' "s|{{TRANSCRIPT_PATH}}|$transcript_path|g" "${output_file}.tmp"
    sed -i '' "s|{{BACKGROUND_FILE_PATH}}|$background_file|g" "${output_file}.tmp"
    sed -i '' "s|{{OUTPUT_PATH}}|$output_path|g" "${output_file}.tmp"
    sed -i '' "s|{{CURRENT_STATS}}|$current_stats|g" "${output_file}.tmp"
    sed -i '' "s|{{VOLUME_METRICS}}|$volume_metrics|g" "${output_file}.tmp"
    sed -i '' "s|{{PRICING_INFO}}|$pricing_info|g" "${output_file}.tmp"
    sed -i '' "s|{{SALES_PROCESS_INFO}}|$sales_process|g" "${output_file}.tmp"
    sed -i '' "s|{{TOTAL_TRANSCRIPTS}}|$total_transcripts|g" "${output_file}.tmp"
    sed -i '' "s|{{BATCH_LIST}}|$batch_list|g" "${output_file}.tmp"
    
    # Replace awareness stage placeholders with defaults if empty
    sed -i '' "s|{{PROBLEM_AWARE_INDICATORS}}|${problem_indicators:-"- Pain points to be identified from transcripts"}|g" "${output_file}.tmp"
    sed -i '' "s|{{SOLUTION_AWARE_NEEDS}}|${solution_needs:-"- Solution needs to be identified from transcripts"}|g" "${output_file}.tmp"
    sed -i '' "s|{{COMPETITOR_LIST}}|${competitors:-"- Competitors to be identified from transcripts"}|g" "${output_file}.tmp"
    
    # Replace remaining placeholders with sensible defaults
    sed -i '' "s|{{[^}]*}}|[To be determined from analysis]|g" "${output_file}.tmp"
    
    # Move temp file to final location
    mv "${output_file}.tmp" "$output_file"
}

# Generate the CLAUDE.md file
replace_placeholders "$TEMPLATE_FILE" "$OUTPUT_FILE"

echo -e "${GREEN}✓ Generated CLAUDE.md at: $OUTPUT_FILE${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Review and customize the generated CLAUDE.md file"
echo "2. Add transcript batch mapping at the bottom"
echo "3. Run transcript analysis: ./automation/process-transcripts.sh $CLIENT_NAME 1"

# Send notification
printf '\a'