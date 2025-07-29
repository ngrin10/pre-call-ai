#!/bin/bash
# Post-task hook - Sends Slack notification after task completion

# Get task details from environment or arguments
TASK_NAME="${1:-$CLAUDE_TASK_NAME}"
TASK_TYPE="${2:-$CLAUDE_TASK_TYPE}"
TASK_STATUS="${3:-completed}"

# Get current directory for context
CURRENT_DIR=$(pwd)
PROJECT_NAME=$(basename "$CURRENT_DIR")

# Detect task type if not provided
if [ -z "$TASK_TYPE" ]; then
    if [[ "$TASK_NAME" == *"analysis"* ]]; then
        TASK_TYPE="analysis"
    elif [[ "$TASK_NAME" == *"content"* ]]; then
        TASK_TYPE="content_generation"
    elif [[ "$TASK_NAME" == *"client"* ]]; then
        TASK_TYPE="client_setup"
    else
        TASK_TYPE="general"
    fi
fi

# Gather task details
DETAILS=$(cat <<EOF
{
    "project": "$PROJECT_NAME",
    "completed_at": "$(date +'%Y-%m-%d %H:%M:%S')",
    "git_branch": "$(git branch --show-current 2>/dev/null || echo 'none')",
    "files_modified": $(git diff --name-only 2>/dev/null | jq -R . | jq -s . || echo '[]'),
    "task_duration": "${TASK_DURATION:-unknown}"
}
EOF
)

# Send Slack notification
python3 .claude/scripts/slack_integration.py notify \
    --task "$TASK_NAME" \
    --type "$TASK_TYPE" \
    --status "$TASK_STATUS" \
    --details "$DETAILS"

# Log the notification
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Task completed: $TASK_NAME" >> .claude/logs/task-completions.log