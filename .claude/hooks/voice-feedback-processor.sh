#!/bin/bash
# Voice feedback processor - Processes Slack voice transcripts

# This script should be called when you have a voice transcript
# Usage: ./voice-feedback-processor.sh "task-name" "transcript text..."

TASK_NAME="$1"
TRANSCRIPT="$2"

if [ -z "$TASK_NAME" ] || [ -z "$TRANSCRIPT" ]; then
    echo "Usage: $0 <task-name> <transcript>"
    echo "Example: $0 'jack-bricknell-analysis' 'The analysis was great but...'"
    exit 1
fi

# Process the voice feedback
FEEDBACK_RESULT=$(python3 .claude/scripts/slack_integration.py process-feedback \
    --task "$TASK_NAME" \
    --transcript "$TRANSCRIPT")

echo "Feedback processed:"
echo "$FEEDBACK_RESULT"

# Extract key items from feedback
IMPROVEMENTS=$(echo "$FEEDBACK_RESULT" | jq -r '.what_needs_improvement[]' 2>/dev/null)
ACTIONS=$(echo "$FEEDBACK_RESULT" | jq -r '.action_items[]' 2>/dev/null)

# If we have improvements or actions, create a follow-up task
if [ -n "$IMPROVEMENTS" ] || [ -n "$ACTIONS" ]; then
    echo ""
    echo "Creating follow-up improvements file..."
    
    IMPROVEMENT_FILE=".claude/tasks/improvements-$(date +%Y%m%d-%H%M%S).md"
    cat > "$IMPROVEMENT_FILE" <<EOF
# Improvements from Voice Feedback

**Task:** $TASK_NAME
**Date:** $(date +'%Y-%m-%d %H:%M')

## What Needs Improvement
$IMPROVEMENTS

## Action Items
$ACTIONS

## Original Transcript
$TRANSCRIPT

---

## Implementation Status
- [ ] Review and prioritize improvements
- [ ] Implement changes
- [ ] Test improvements
- [ ] Document changes
EOF

    echo "Improvement file created: $IMPROVEMENT_FILE"
    
    # Also update the main feedback system
    python3 .claude/scripts/feedback_system.py capture \
        --task "$TASK_NAME-improvements" \
        --time 30 \
        --rating 7 \
        --improve "$IMPROVEMENTS" \
        --actions "$ACTIONS"
fi

# Generate updated report
echo ""
echo "Generating feedback report..."
python3 .claude/scripts/slack_integration.py report