#!/bin/bash

# Deep Research Runner Script
# Uses OpenAI Deep Research API to analyze client data

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

# Function to display usage
usage() {
    echo "Usage: $0 <client-name>"
    echo "Example: $0 acme-corp"
    echo ""
    echo "This script runs deep research analysis on client data using OpenAI's API"
    echo "Make sure your OPENAI_API_KEY is set in the .env file"
    exit 1
}

# Check if client name provided
if [ $# -eq 0 ]; then
    usage
fi

CLIENT_NAME="$1"
CLIENT_PATH="$ROOT_DIR/0-INBOX/$CLIENT_NAME"

# Check if client directory exists
if [ ! -d "$CLIENT_PATH" ]; then
    echo -e "${RED}Error: Client directory not found: $CLIENT_PATH${NC}"
    echo "Please make sure the client folder exists in 0-INBOX/"
    exit 1
fi

# Check for .env file
if [ ! -f "$ROOT_DIR/.env" ]; then
    echo -e "${RED}Error: .env file not found in root directory${NC}"
    echo "Please create a .env file with your OPENAI_API_KEY"
    echo "Example: echo 'OPENAI_API_KEY=your-key-here' > $ROOT_DIR/.env"
    exit 1
fi

# Check if OPENAI_API_KEY is in .env
if ! grep -q "OPENAI_API_KEY" "$ROOT_DIR/.env"; then
    echo -e "${RED}Error: OPENAI_API_KEY not found in .env file${NC}"
    echo "Please add your OpenAI API key to the .env file"
    echo "Example: echo 'OPENAI_API_KEY=your-key-here' >> $ROOT_DIR/.env"
    exit 1
fi

echo -e "${GREEN}=== ScaleStream Deep Research Analysis ===${NC}"
echo -e "Client: ${YELLOW}$CLIENT_NAME${NC}"
echo -e "Path: $CLIENT_PATH"
echo ""

# Check if required files exist
echo "Checking required files..."
REQUIRED_FILES=(
    "00-onboarding-checklist.md"
    "01-client-info.md"
    "02-sales-transcripts/02-sales-transcripts.md"
    "03-marketing-materials/03-marketing-materials.md"
    "04-onboarding-call.md"
)

MISSING_FILES=0
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$CLIENT_PATH/$file" ]; then
        echo -e "${RED}✗ Missing: $file${NC}"
        MISSING_FILES=$((MISSING_FILES + 1))
    else
        echo -e "${GREEN}✓ Found: $file${NC}"
    fi
done

if [ $MISSING_FILES -gt 0 ]; then
    echo ""
    echo -e "${YELLOW}Warning: $MISSING_FILES required files are missing${NC}"
    echo "The research will proceed but results may be incomplete"
    echo -n "Continue anyway? (y/n): "
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Research cancelled"
        exit 0
    fi
fi

echo ""
echo -e "${YELLOW}Starting deep research analysis...${NC}"
echo "This process typically takes 5-10 minutes"
echo ""

# Run the Python script
cd "$ROOT_DIR"
python3 "$SCRIPT_DIR/deep-research-client.py" "$CLIENT_PATH"

# Check if successful
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ Deep research completed successfully!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Review the generated research in: $CLIENT_PATH/05-research.md"
    echo "2. Update any missing or incorrect information"
    echo "3. Use the insights for creating awareness-specific content"
    
    # Ring the terminal bell
    echo -e "\a"
else
    echo ""
    echo -e "${RED}❌ Deep research failed${NC}"
    echo "Please check the error messages above"
    exit 1
fi