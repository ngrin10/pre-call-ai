#!/bin/bash

# 🎯 SCALESTREAM Quick Commands
# Common operations with simple syntax

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Get command
COMMAND="$1"
shift # Remove first argument

# Show help if no command
if [ -z "$COMMAND" ]; then
    echo -e "${BLUE}🎯 SCALESTREAM Quick Commands${NC}"
    echo ""
    echo "Usage: ./quick <command> [args]"
    echo ""
    echo "Commands:"
    echo "  ${YELLOW}new${NC} <client>          - Start new client onboarding"
    echo "  ${YELLOW}setup${NC} <client>        - Generate custom CLAUDE.md from config"
    echo "  ${YELLOW}analyze${NC} <client>      - Run complete analysis pipeline"
    echo "  ${YELLOW}batch${NC} <client> <num>  - Process specific batch"
    echo "  ${YELLOW}content${NC} <client> <level> - Generate content for awareness level"
    echo "  ${YELLOW}check${NC} <client>        - Run quality gates"
    echo "  ${YELLOW}status${NC} <client>       - Show client progress"
    echo "  ${YELLOW}notify${NC}                - Test notification bell"
    echo ""
    echo "Awareness levels: problem-aware, solution-aware, product-aware"
    exit 0
fi

# Execute commands
case $COMMAND in
    "new")
        CLIENT="$1"
        if [ -z "$CLIENT" ]; then
            echo -e "${RED}Error: Client name required${NC}"
            exit 1
        fi
        echo -e "${BLUE}🚀 Starting new client onboarding for: $CLIENT${NC}"
        
        # Create directory structure
        mkdir -p "./data/clients/$CLIENT"/{transcripts,analysis,segments,content,metrics}
        mkdir -p "./data/clients/$CLIENT/content"/{problem-aware,solution-aware,product-aware}
        
        # Copy templates from new-client-template
        cp "./0-INBOX/new-client-template/COMPLETE-ONBOARDING-FORM.md" "./data/clients/$CLIENT/onboarding-form.md"
        cp "./0-INBOX/new-client-template/01-client-info.md" "./data/clients/$CLIENT/client-brief.md"
        cp "./0-INBOX/new-client-template/VA-TRANSCRIPT-COLLECTION.md" "./data/clients/$CLIENT/va-instructions.md"
        
        # Create client config template
        cat > "./data/clients/$CLIENT/client-config.yaml" << EOF
# Client Configuration - $CLIENT
# This file defines all the variables needed to generate a custom CLAUDE.md

client_info:
  name: "$CLIENT"
  description: "[Business description - what they do]"
  solution_category: "[Type of solution - e.g., visualization software, CRM, etc.]"
  target_audience: "[Who they sell to - e.g., contractors, agencies]"
  target_descriptor: "[Single word - e.g., contractor, agency, consultant]"

paths:
  transcript_path: "./data/clients/$CLIENT/transcripts/"
  background_file: "./data/clients/$CLIENT/client-brief.md"
  output_path: "./data/clients/$CLIENT/analysis/"
  master_analysis_file: "Transcript_analysis_extensive_$(date +%Y).md"
  final_analysis_file: "Transcript_analysis_extensive_$(date +%Y)_FINAL.md"

business_metrics:
  current_stats: "[e.g., 15% higher close rates reported]"
  volume_metrics: "[e.g., 10,000+ users on platform]"
  pricing_info: "[e.g., Starting at \$249/month]"
  sales_process: "[e.g., Demo-based sales, common objections include...]"

awareness_stages:
  problem_aware:
    indicators:
      - "[Pain point indicator 1]"
      - "[Pain point indicator 2]"
      - "[Pain point indicator 3]"
    pain_points:
      - "[Specific pain 1]"
      - "[Specific pain 2]"
    search_terms: "[What they search for]"
    example: "[Example descriptor]"

  solution_aware:
    needs:
      - "[Solution need 1]"
      - "[Solution need 2]"
    comparisons: "[What they compare]"
    search_terms: "[Solution search terms]"
    requirements: "[What they need]"
    example: "[Example descriptor]"

  product_aware:
    behaviors:
      - "[Product behavior 1]"
      - "[Product behavior 2]"
    search_terms: "[Product search terms]"
    example: "[Example descriptor]"

competitors:
  main_competitors:
    - name: "[Competitor 1]"
      description: "[Why they're a threat]"
    - name: "[Competitor 2]"
      description: "[Why they're a threat]"
  
differentiation:
  points:
    - "[Key differentiator 1]"
    - "[Key differentiator 2]"

transcripts:
  total: 0  # Update after adding transcripts
  batch_size: 5  # Keep at 5 for forensic analysis
  date_range: "[Date range of calls]"
EOF
        
        echo -e "${GREEN}✅ Client workspace created${NC}"
        echo -e "${YELLOW}Next steps:${NC}"
        echo "1. Edit ./data/clients/$CLIENT/client-brief.md"
        echo "2. Edit ./data/clients/$CLIENT/client-config.yaml"
        echo "3. Add transcripts to ./data/clients/$CLIENT/transcripts/"
        echo "4. Run: ./automation/generate-client-claude-md.sh $CLIENT"
        ;;
        
    "setup")
        CLIENT="$1"
        if [ -z "$CLIENT" ]; then
            echo -e "${RED}Error: Client name required${NC}"
            exit 1
        fi
        ./automation/generate-client-claude-md.sh "$CLIENT"
        ;;
        
    "analyze")
        CLIENT="$1"
        ./automation/run-analysis.sh "$CLIENT"
        ;;
        
    "batch")
        CLIENT="$1"
        BATCH="$2"
        ./automation/process-transcripts.sh "$CLIENT" "$BATCH"
        ;;
        
    "content")
        CLIENT="$1"
        LEVEL="$2"
        ./automation/generate-content.sh "$CLIENT" "$LEVEL"
        ;;
        
    "check")
        CLIENT="$1"
        if [ -z "$CLIENT" ]; then
            echo -e "${RED}Error: Client name required${NC}"
            exit 1
        fi
        
        echo -e "${BLUE}🔍 Running quality gates for: $CLIENT${NC}"
        
        # Check transcripts
        if [ -d "./data/clients/$CLIENT/transcripts" ]; then
            count=$(find "./data/clients/$CLIENT/transcripts" -name "*.md" | wc -l)
            if [ $count -ge 15 ]; then
                echo -e "${GREEN}✅ Transcripts: $count files found${NC}"
            else
                echo -e "${RED}❌ Transcripts: Only $count files (need 15+)${NC}"
            fi
        else
            echo -e "${RED}❌ Transcripts directory missing${NC}"
        fi
        
        # Check client brief
        if [ -f "./data/clients/$CLIENT/client-brief.md" ]; then
            echo -e "${GREEN}✅ Client brief exists${NC}"
        else
            echo -e "${RED}❌ Client brief missing${NC}"
        fi
        
        # Check analysis
        if [ -d "./data/clients/$CLIENT/analysis" ]; then
            echo -e "${GREEN}✅ Analysis directory exists${NC}"
        else
            echo -e "${YELLOW}⚠️  Analysis not started${NC}"
        fi
        ;;
        
    "status")
        CLIENT="$1"
        if [ -z "$CLIENT" ]; then
            echo -e "${RED}Error: Client name required${NC}"
            exit 1
        fi
        
        echo -e "${BLUE}📊 Status for: $CLIENT${NC}"
        echo ""
        
        # Check each phase
        echo -e "${YELLOW}Phase 1: Setup${NC}"
        [ -d "./data/clients/$CLIENT" ] && echo "✅ Workspace created" || echo "❌ Workspace missing"
        [ -f "./data/clients/$CLIENT/client-brief.md" ] && echo "✅ Client brief exists" || echo "❌ Client brief missing"
        
        echo -e "\n${YELLOW}Phase 2: Data Collection${NC}"
        if [ -d "./data/clients/$CLIENT/transcripts" ]; then
            count=$(find "./data/clients/$CLIENT/transcripts" -name "*.md" 2>/dev/null | wc -l)
            echo "✅ Transcripts: $count files"
        else
            echo "❌ No transcripts"
        fi
        
        echo -e "\n${YELLOW}Phase 3: Analysis${NC}"
        if [ -d "./data/clients/$CLIENT/analysis" ]; then
            batches=$(find "./data/clients/$CLIENT/analysis" -name "batch-*-prompt.md" 2>/dev/null | wc -l)
            echo "✅ Analysis batches: $batches"
        else
            echo "❌ Analysis not started"
        fi
        
        echo -e "\n${YELLOW}Phase 4: Content${NC}"
        for level in problem-aware solution-aware product-aware; do
            if [ -f "./data/clients/$CLIENT/content/$level/email-sequence.md" ]; then
                echo "✅ $level content created"
            else
                echo "❌ $level content missing"
            fi
        done
        ;;
        
    "notify")
        echo -e "${GREEN}Testing notification...${NC}"
        echo -e "\a" # Single bell
        sleep 0.5
        echo -e "\a\a" # Double bell
        sleep 0.5
        echo -e "\a\a\a" # Triple bell
        echo -e "${GREEN}✅ Notification sent!${NC}"
        ;;
        
    *)
        echo -e "${RED}Unknown command: $COMMAND${NC}"
        echo "Run './quick' for help"
        exit 1
        ;;
esac