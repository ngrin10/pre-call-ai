#!/bin/bash
# Setup script for Slack integration

echo "🔧 Setting up Slack integration for Claude Code"
echo ""

# Check if webhook URL is already set
if [ -f "$HOME/.scalestream-slack-config" ]; then
    source "$HOME/.scalestream-slack-config"
    echo "✅ Found existing Slack configuration"
    echo "   Webhook URL: ${SLACK_WEBHOOK_URL:0:30}..."
    echo ""
    read -p "Do you want to update it? (y/N): " update
    if [[ ! "$update" =~ ^[Yy]$ ]]; then
        echo "Keeping existing configuration."
        exit 0
    fi
fi

echo "📋 To set up Slack notifications, you need a Slack webhook URL"
echo ""
echo "Steps to get a webhook URL:"
echo "1. Go to https://api.slack.com/apps"
echo "2. Create a new app (or select existing)"
echo "3. Add 'Incoming Webhooks' feature"
echo "4. Create a webhook for your desired channel"
echo "5. Copy the webhook URL"
echo ""

read -p "Enter your Slack webhook URL: " webhook_url

if [ -z "$webhook_url" ]; then
    echo "❌ No webhook URL provided. Exiting."
    exit 1
fi

# Save configuration
cat > "$HOME/.scalestream-slack-config" << EOF
# ScaleStream Slack Configuration
export SLACK_WEBHOOK_URL="$webhook_url"
export SLACK_NOTIFICATIONS_ENABLED="true"
EOF

echo "✅ Slack configuration saved to ~/.scalestream-slack-config"
echo ""

# Add to shell profile if not already there
SHELL_PROFILE="$HOME/.bashrc"
if [ -f "$HOME/.zshrc" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
fi

if ! grep -q "scalestream-slack-config" "$SHELL_PROFILE"; then
    echo "" >> "$SHELL_PROFILE"
    echo "# ScaleStream Slack integration" >> "$SHELL_PROFILE"
    echo "[ -f \"\$HOME/.scalestream-slack-config\" ] && source \"\$HOME/.scalestream-slack-config\"" >> "$SHELL_PROFILE"
    echo "✅ Added to $SHELL_PROFILE"
fi

# Test the webhook
echo ""
echo "🧪 Testing Slack webhook..."
python3 - << EOF
import requests
import json

webhook_url = "$webhook_url"
test_message = {
    "blocks": [
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": "✅ *ScaleStream Slack Integration Test*\\n\\nIf you see this message, your Slack integration is working correctly!"
            }
        }
    ]
}

try:
    response = requests.post(webhook_url, json=test_message)
    if response.status_code == 200:
        print("✅ Test message sent successfully!")
    else:
        print(f"❌ Failed to send test message: {response.status_code}")
except Exception as e:
    print(f"❌ Error: {e}")
EOF

echo ""
echo "🎉 Setup complete! Your Slack integration is ready."
echo ""
echo "To use:"
echo "1. Source your shell profile: source $SHELL_PROFILE"
echo "2. Or restart your terminal"
echo ""
echo "Voice feedback workflow:"
echo "1. You'll get Slack notifications when tasks complete"
echo "2. Send a voice note in reply mentioning the task ID"
echo "3. Process it with: ./voice-feedback-processor.sh <task-id> <transcript>"