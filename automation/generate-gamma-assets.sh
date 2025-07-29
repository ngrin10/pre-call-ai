#!/bin/bash

# Generate Gamma Visual Assets
# Creates presentations for each awareness level using Gamma API

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

# Check if client name provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: Client name required${NC}"
    echo "Usage: $0 <client-name>"
    exit 1
fi

CLIENT_NAME="$1"
CLIENT_PATH="$ROOT_DIR/data/clients/$CLIENT_NAME"

# Check if client exists
if [ ! -d "$CLIENT_PATH" ]; then
    echo -e "${RED}Error: Client directory not found: $CLIENT_PATH${NC}"
    exit 1
fi

# Check for Gamma API key
if [ ! -f "$ROOT_DIR/.env" ]; then
    echo -e "${RED}Error: .env file not found${NC}"
    echo "Please create .env with: GAMMA_API_KEY=sk-gamma-xxx"
    exit 1
fi

if ! grep -q "GAMMA_API_KEY" "$ROOT_DIR/.env"; then
    echo -e "${RED}Error: GAMMA_API_KEY not found in .env${NC}"
    echo "Please add: GAMMA_API_KEY=sk-gamma-xxx"
    exit 1
fi

echo -e "${BLUE}=== Gamma Visual Asset Generation ===${NC}"
echo -e "Client: ${YELLOW}$CLIENT_NAME${NC}"
echo ""

# Check prerequisites
echo "Checking prerequisites..."

# Check if email sequences exist
if [ ! -f "$CLIENT_PATH/content/problem-aware/email-sequence.md" ]; then
    echo -e "${RED}✗ Email sequences not found${NC}"
    echo "Please run content generation first: ./quick content $CLIENT_NAME problem-aware"
    exit 1
fi

# Check if segment synthesis exists
if [ ! -f "$CLIENT_PATH/analysis/segment-synthesis.md" ]; then
    echo -e "${RED}✗ Segment synthesis not found${NC}"
    echo "Please run analysis first: ./quick analyze $CLIENT_NAME"
    exit 1
fi

echo -e "${GREEN}✓ Prerequisites checked${NC}"
echo ""

# Generate assets
echo -e "${YELLOW}Generating visual assets...${NC}"
echo "This will create:"
echo "  • Problem Aware: Educational presentation"
echo "  • Solution Aware: Comparison guide"
echo "  • Product Aware: Sales deck"
echo ""
echo "Each deck takes 30-60 seconds to generate..."
echo ""

# Run Python script
cd "$ROOT_DIR"
python3 "$SCRIPT_DIR/generate-gamma-assets.py" "$CLIENT_NAME"

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ Visual assets generated successfully!${NC}"
    echo ""
    echo "Assets saved to: $CLIENT_PATH/content/gamma-assets.json"
    echo ""
    echo "Next steps:"
    echo "1. Review each generated presentation"
    echo "2. Customize as needed in Gamma editor"
    echo "3. Export as PDF for email attachments"
    echo "4. Use URLs for direct sharing"
    
    # Terminal bell
    echo -e "\a"
else
    echo -e "${RED}❌ Asset generation failed${NC}"
    exit 1
fi