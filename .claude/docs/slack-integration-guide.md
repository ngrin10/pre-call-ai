# 🔔 Slack Integration Guide

Automated notifications and voice feedback processing for ScaleStream workflows.

## 🚀 Quick Start

### 1. Initial Setup
```bash
# Run the setup script
.claude/scripts/setup-slack.sh

# Follow prompts to add your Slack webhook URL
```

### 2. Test Notifications
```bash
# Send a test notification
python3 .claude/scripts/slack_integration.py notify \
  --task "test-task" \
  --type "test" \
  --status "completed"
```

## 📱 Notification Types

### Automatic Notifications

Notifications are sent automatically for:

1. **Client Setup** (`new`, `move-to-analysis`)
   - When new client folder is created
   - When client moves to analysis phase
   
2. **Analysis Tasks** 
   - Batch processing completion
   - Full analysis completion
   - Synthesis generation
   
3. **Content Generation**
   - Awareness-specific content ready
   - Email sequences generated
   - SMS flows created

4. **Errors**
   - Processing failures
   - Missing data
   - Quality gate failures

### Notification Format

```
✅ Claude Code: Analysis Update
─────────────────────────────
Task: jack-bricknell-analysis
Status: Completed

Details:
• Transcripts Processed: 20
• Segments Identified: 3
• Completion Time: 15 mins

📁 Files:
Created:
• analysis/batch-1-results.md
• analysis/segment-profiles.md

🎤 Voice Feedback Requested
Please send a voice note with:
• What worked well
• What needs improvement
• Any specific changes needed

Reply with voice note mentioning: jack-bricknell-analysis
```

## 🎤 Voice Feedback Workflow

### 1. Receive Notification
When a task completes, you'll get a Slack notification requesting voice feedback.

### 2. Send Voice Note
Reply in Slack with a voice note that includes:
- The task ID mentioned in the notification
- What worked well
- What needs improvement
- Specific action items

### 3. Get Transcript
Slack will transcribe your voice note. Copy the transcript text.

### 4. Process Feedback
```bash
# Process the voice feedback
.claude/hooks/voice-feedback-processor.sh "task-name" "Your transcript here..."
```

### 5. Review Improvements
The processor will:
- Extract key improvements and action items
- Create an improvement task file
- Update the feedback system
- Generate a summary report

## 🔧 Configuration

### Environment Variables
```bash
# In ~/.scalestream-slack-config
export SLACK_WEBHOOK_URL="https://hooks.slack.com/services/..."
export SLACK_NOTIFICATIONS_ENABLED="true"

# Disable notifications temporarily
export SLACK_NOTIFICATIONS_ENABLED="false"
```

### Customizing Notifications

Edit task types that request voice feedback:
```python
# In slack_integration.py
voice_feedback_types = ["analysis", "content_generation", "client_setup", "major_update"]
```

## 📊 Reporting

### View Pending Feedback
```bash
# See which tasks are awaiting voice feedback
python3 .claude/scripts/slack_integration.py pending
```

### Generate Feedback Report
```bash
# Analyze all collected feedback
python3 .claude/scripts/slack_integration.py report
```

### Sample Report Output
```
# Voice Feedback Analysis Report
Generated: 2024-01-15 14:30

## Average Satisfaction: 8.5/10

## What's Working Well
- Fast transcript processing (mentioned 5x)
- Clear segment identification (mentioned 4x)
- Good email templates (mentioned 3x)

## Common Improvement Areas
- Need more context in prompts (mentioned 4x)
- Want preview before sending (mentioned 3x)

## Recommended Actions
1. Add context preview step to workflow
2. Implement draft review process
3. Enhance prompt templates with more business context
```

## 🛠️ Advanced Usage

### Custom Notifications
```python
from claude.scripts.slack_integration import on_task_complete

# In your Python scripts
on_task_complete(
    task_name="custom-analysis",
    task_type="analysis",
    transcripts_processed=25,
    segments_found=["problem-aware", "solution-aware"],
    files_created=["analysis/results.md"]
)
```

### Webhook Testing
```bash
# Test your webhook directly
curl -X POST -H 'Content-type: application/json' \
  --data '{"text":"Test from ScaleStream"}' \
  YOUR_WEBHOOK_URL
```

### Integration with Existing Workflows

The Slack integration automatically hooks into:
- `quick` commands
- Analysis scripts
- Content generation
- Error handling

No additional code needed - just run setup and it works!

## 🚨 Troubleshooting

### No Notifications Received
1. Check webhook URL is correct
2. Verify `SLACK_NOTIFICATIONS_ENABLED="true"`
3. Test webhook manually
4. Check `.claude/logs/slack/` for errors

### Voice Feedback Not Processing
1. Ensure task name matches exactly
2. Check transcript has clear sections
3. Review `.claude/logs/slack/processed_feedback.json`

### Missing Dependencies
```bash
# Install required Python packages
pip install requests
```

## 📚 Best Practices

1. **Voice Feedback Quality**
   - Be specific about improvements
   - Mention the task name clearly
   - Structure feedback: worked well → needs improvement → actions

2. **Notification Management**
   - Don't ignore notifications - they track pending work
   - Process voice feedback promptly
   - Review weekly improvement reports

3. **Team Collaboration**
   - Share the webhook URL with team members
   - Standardize voice feedback format
   - Review aggregated insights together

## 🔗 Related Documentation

- [Feedback System Guide](.claude/docs/feedback-system.md)
- [Automation Workflows](automation/README.md)
- [Quick Commands](automation/quick-commands.sh)