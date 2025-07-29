#!/bin/bash
# Process voice note transcripts from Slack

TASK_NAME="$1"
TRANSCRIPT="$2"

if [ -z "$TASK_NAME" ] || [ -z "$TRANSCRIPT" ]; then
    echo "Usage: $0 <task-name> <transcript>"
    echo ""
    echo "Example:"
    echo "$0 'jack-analysis' 'The analysis went well but the prompts were too long...'"
    exit 1
fi

# Create improvement file
IMPROVEMENT_DIR=".claude/improvements"
mkdir -p "$IMPROVEMENT_DIR"
IMPROVEMENT_FILE="$IMPROVEMENT_DIR/$(date +%Y%m%d-%H%M%S)-$TASK_NAME.md"

# Parse the transcript and create improvement doc
cat > "$IMPROVEMENT_FILE" << EOF
# 📝 Improvement from Voice Feedback

**Task:** $TASK_NAME
**Date:** $(date '+%Y-%m-%d %H:%M')

## Voice Transcript
$TRANSCRIPT

## Extracted Insights

### What Worked Well ✅
EOF

# Simple keyword extraction for "worked well" section
echo "$TRANSCRIPT" | grep -i -E "(worked|good|great|excellent|perfect)" | sed 's/^/- /' >> "$IMPROVEMENT_FILE" || echo "- [Extract from transcript above]" >> "$IMPROVEMENT_FILE"

cat >> "$IMPROVEMENT_FILE" << EOF

### What Needs Improvement 🔧
EOF

# Extract improvement keywords
echo "$TRANSCRIPT" | grep -i -E "(improve|better|issue|problem|fix|need)" | sed 's/^/- /' >> "$IMPROVEMENT_FILE" || echo "- [Extract from transcript above]" >> "$IMPROVEMENT_FILE"

cat >> "$IMPROVEMENT_FILE" << EOF

### Action Items 🎯
EOF

# Extract action keywords
echo "$TRANSCRIPT" | grep -i -E "(should|must|need to|have to|action|todo)" | sed 's/^/- [ ] /' >> "$IMPROVEMENT_FILE" || echo "- [ ] [Extract from transcript above]" >> "$IMPROVEMENT_FILE"

cat >> "$IMPROVEMENT_FILE" << EOF

## Implementation Plan
1. Review extracted insights above
2. Prioritize improvements
3. Implement changes
4. Test improvements
5. Document updates

---
*Note: Review and refine the extracted insights above for accuracy*
EOF

# Display results
echo "✅ Voice feedback processed!"
echo "📄 Improvement file created: $IMPROVEMENT_FILE"
echo ""
echo "📋 Summary:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
head -20 "$IMPROVEMENT_FILE"
echo "..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo "1. Edit $IMPROVEMENT_FILE to refine insights"
echo "2. Create tasks from action items"
echo "3. Track implementation progress"