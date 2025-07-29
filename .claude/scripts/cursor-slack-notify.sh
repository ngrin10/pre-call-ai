#!/bin/bash
# Simplified Slack notifications for Cursor's integrated Slack

# Since Cursor already has Slack integration, we just need to format messages
# that you can easily copy/paste or that Cursor can send

TASK_NAME="$1"
TASK_TYPE="$2"
STATUS="${3:-completed}"
CLIENT="${4:-}"

# Generate notification message
generate_notification() {
    local emoji="✅"
    [ "$STATUS" = "error" ] && emoji="❌"
    [ "$STATUS" = "in_progress" ] && emoji="🔄"
    
    cat << EOF
$emoji ScaleStream Update: $TASK_TYPE

**Task:** $TASK_NAME
**Status:** $STATUS
**Time:** $(date '+%Y-%m-%d %H:%M')
EOF

    # Add client info if provided
    [ -n "$CLIENT" ] && echo "**Client:** $CLIENT"
    
    # Add task-specific details
    case "$TASK_TYPE" in
        "analysis")
            echo "
📊 **Details:**
- Check analysis results in: ./data/clients/$CLIENT/analysis/
- Next: Run synthesis prompt in Claude
- Then: Generate content for each segment"
            ;;
        "content")
            echo "
📝 **Details:**
- Content ready in: ./data/clients/$CLIENT/content/
- Review email sequences and SMS flows
- Deploy to platform when approved"
            ;;
        "client_setup")
            echo "
🚀 **Details:**
- Client folder created in: ./0-INBOX/$CLIENT/
- Next: Complete onboarding form
- Add 15+ sales transcripts"
            ;;
    esac
    
    echo "
🎤 **Voice Feedback Requested**
Please share feedback on what worked well and what needs improvement."
}

# Save notification to file for easy copying
NOTIFICATION_FILE="/tmp/scalestream-notification-$(date +%s).txt"
generate_notification > "$NOTIFICATION_FILE"

# Display the notification
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cat "$NOTIFICATION_FILE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Notification saved to: $NOTIFICATION_FILE"
echo "📱 Copy above message to Slack or use Cursor's Slack integration"

# Also append to daily log
LOG_DIR="$HOME/.scalestream-logs"
mkdir -p "$LOG_DIR"
echo "---" >> "$LOG_DIR/notifications-$(date +%Y-%m-%d).log"
echo "$(date '+%H:%M:%S') - $TASK_TYPE - $TASK_NAME - $STATUS" >> "$LOG_DIR/notifications-$(date +%Y-%m-%d).log"