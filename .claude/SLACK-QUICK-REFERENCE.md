# 🔔 Slack Integration Quick Reference

## 🚀 One-Time Setup (2 mins)
```bash
./scalestream-system/.claude/scripts/setup-slack.sh
```

## 📱 What Gets Notified

### Automatic Notifications:
- ✅ New client setup complete
- ✅ Client moved to analysis phase  
- ✅ Batch processing complete
- ✅ Full analysis pipeline done
- ✅ Content generation ready
- ❌ Any errors or failures

### Voice Feedback Requested For:
- Analysis completions
- Content generation
- Major updates
- Client setups

## 🎤 Voice Feedback Workflow

1. **Get Notification** → Slack alert with task details
2. **Send Voice Note** → Reply in Slack, mention task name
3. **Copy Transcript** → Slack auto-transcribes voice
4. **Process Feedback**:
```bash
./scalestream-system/.claude/hooks/voice-feedback-processor.sh \
  "task-name" \
  "Your transcript text here..."
```

## 🛠️ Common Commands

### Test Notification
```bash
python3 .claude/scripts/slack_integration.py notify \
  --task "test" --type "test" --status "completed"
```

### Check Pending Feedback
```bash
python3 .claude/scripts/slack_integration.py pending
```

### Generate Report
```bash
python3 .claude/scripts/slack_integration.py report
```

### Disable Temporarily
```bash
export SLACK_NOTIFICATIONS_ENABLED="false"
```

## 📊 What Voice Feedback Should Include

✅ Good feedback example:
> "The jack-bricknell-analysis worked really well. What worked: the segment identification was spot on, found all three awareness levels clearly. What needs improvement: the prompts were a bit too long, could be more concise. Also need better formatting for the quotes section. Action items: shorten prompts by 30%, add quote formatting template, maybe add a summary at the top of each batch."

❌ Poor feedback example:
> "It was fine, maybe make it better"

## 🔧 Troubleshooting

**Not getting notifications?**
1. Check: `echo $SLACK_WEBHOOK_URL` (should show URL)
2. Check: `echo $SLACK_NOTIFICATIONS_ENABLED` (should be "true")
3. Test webhook manually

**Voice feedback not processing?**
- Make sure task name matches exactly
- Include clear sections (what worked, improvements, actions)

## 📈 Benefits

- **No Manual Tracking**: Everything logged automatically
- **Voice > Typing**: Faster feedback capture
- **Learning System**: Improves over time
- **Team Visibility**: Everyone sees progress
- **Action Items**: Never lose improvement ideas

---

Remember: The more specific your voice feedback, the better the system becomes! 🚀