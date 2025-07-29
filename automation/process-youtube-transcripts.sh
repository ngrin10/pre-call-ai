#!/bin/bash

# YouTube Transcript Processing Script
# Helps organize and extract patterns from YouTube transcripts

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if client name provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <video-name>"
    echo "Example: $0 pre-call-funnel"
    exit 1
fi

VIDEO_NAME=$1
BASE_DIR="/Users/nikolaigrin/Desktop/SystemFlow.io/scalestream-system"
YOUTUBE_DIR="$BASE_DIR/examples/winning/youtube-transcripts"
VIDEO_DIR="$YOUTUBE_DIR/videos/$VIDEO_NAME"

echo -e "${BLUE}📹 Processing YouTube Transcript: $VIDEO_NAME${NC}"
echo "=================================================="

# Create directory structure
echo -e "${YELLOW}Creating directory structure...${NC}"
mkdir -p "$VIDEO_DIR"/{raw,processed,patterns}
mkdir -p "$YOUTUBE_DIR/by-awareness-level"/{problem-aware,solution-aware,product-aware}
mkdir -p "$YOUTUBE_DIR/extracted-patterns"

# Create processing template
echo -e "${YELLOW}Creating processing template...${NC}"
cat > "$VIDEO_DIR/processed/extraction-notes.md" << 'EOF'
# Video Processing Notes: [VIDEO_NAME]

## Quick Summary
- Date Processed: $(date +%Y-%m-%d)
- Processor: [Your name]
- Primary Awareness Level: [Problem/Solution/Product]

## Top 5 Extractions
1. **Best Hook**: "[Quote]" - Use in: [Context]
2. **Key Framework**: [Name] - [Brief description]
3. **Power Story**: [Title] - [One line summary]
4. **Psychological Trigger**: [Type] - [How it works]
5. **Unique Insight**: "[Quote]" - [Why valuable]

## Awareness Level Breakdown

### Problem Aware Content
- Key Quotes: [List with timestamps]
- Pain Points: [Specific problems mentioned]
- Usage: [Where to apply]

### Solution Aware Content
- Methodologies: [Frameworks explained]
- Comparisons: [How positioned vs alternatives]
- Usage: [Where to apply]

### Product Aware Content
- Results: [Specific outcomes mentioned]
- Urgency: [Scarcity/timeline tactics]
- Usage: [Where to apply]

## Integration Notes
- Combines well with: [Other content]
- Best for: [Client type/industry]
- Avoid when: [Situations where not applicable]

## Action Items
- [ ] Extract top 3 quotes for each awareness level
- [ ] Create email template using main framework
- [ ] Add best hook to pattern library
- [ ] Test with: [Specific client or campaign]
EOF

# Create pattern extraction file
echo -e "${YELLOW}Creating pattern file...${NC}"
cat > "$VIDEO_DIR/patterns/extracted-patterns.md" << 'EOF'
# Extracted Patterns: [VIDEO_NAME]

## 🎯 Hooks & Openings
```
Pattern: [Structure]
Example: "[Actual quote]"
Use When: [Context]
```

## 📚 Frameworks
```
Framework: [Name]
Steps:
1. [Step]
2. [Step]
3. [Step]
Application: [When/how to use]
```

## 📖 Story Templates
```
Story Type: [Category]
Structure: [Beginning] → [Middle] → [End]
Moral: [Lesson]
Adaptation: [How to customize]
```

## 💭 Psychological Triggers
```
Trigger: [Type]
How It Works: [Mechanism]
Example: "[Quote showing trigger]"
Warning: [When not to use]
```

## 🎨 Content Templates

### Email Template
```
Subject: [Pattern extracted]
Hook: [Opening pattern]
Body: [Structure observed]
CTA: [Call to action pattern]
```

### VSL Section
```
[Section name]: [Pattern observed]
Duration: [Typical length]
Key Elements: [What must be included]
```

### Trust Asset Idea
```
Type: [Asset category]
Purpose: [What it accomplishes]
Format: [How to create]
Distribution: [Where/when to use]
```
EOF

# Create integration checklist
echo -e "${YELLOW}Creating integration checklist...${NC}"
cat > "$VIDEO_DIR/integration-checklist.md" << 'EOF'
# Integration Checklist: [VIDEO_NAME]

## Immediate Actions
- [ ] Add best hooks to `/prompts/03-content-generation.md`
- [ ] Update email templates with new patterns
- [ ] Create trust asset based on main framework
- [ ] Add to awareness-level specific folders

## Pattern Library Updates
- [ ] Add to `/examples/winning/youtube-transcripts/extracted-patterns/hooks.md`
- [ ] Update `/examples/winning/youtube-transcripts/extracted-patterns/frameworks.md`
- [ ] Enhance `/examples/winning/youtube-transcripts/extracted-patterns/stories.md`

## Content Enhancement
- [ ] Update Problem Aware email sequence
- [ ] Enhance Solution Aware comparison content
- [ ] Strengthen Product Aware urgency tactics
- [ ] Revise VSL script with new patterns

## Testing Plan
- [ ] Client to test with: ___________
- [ ] Metrics to track: ___________
- [ ] Timeline: ___________
- [ ] Success criteria: ___________

## Cross-Reference
- [ ] Link to related videos
- [ ] Update master pattern index
- [ ] Note in client implementation guides
EOF

echo -e "${GREEN}✅ Created processing structure for $VIDEO_NAME${NC}"
echo ""
echo "📁 Directory created at: $VIDEO_DIR"
echo ""
echo "Next steps:"
echo "1. Add transcript to: $VIDEO_DIR/raw/transcript.txt"
echo "2. Process using template in: $VIDEO_DIR/processed/extraction-notes.md"
echo "3. Extract patterns to: $VIDEO_DIR/patterns/extracted-patterns.md"
echo "4. Complete: $VIDEO_DIR/integration-checklist.md"
echo ""
echo -e "${BLUE}💡 Tip: Process in 25-minute focused sessions for best results${NC}"

# Ring terminal bell when complete
echo -e '\a'