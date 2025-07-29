# 🚀 ScaleStream + Cursor Slack Workflow

Now that Cursor has native Slack integration with Background Agents, here's the optimal workflow:

## 🎯 Direct Slack Commands

### New Client Setup
```
@Cursor create new client folder for [client-name] in 0-INBOX using the template
```

### Run Analysis
```
@Cursor [repo=YourRepo/scalestream] analyze transcripts for [client-name] - process in batches of 5 and create synthesis prompt
```

### Generate Content
```
@Cursor generate problem-aware email sequences for [client-name] based on analysis
```

## 🎤 Voice Feedback Workflow

1. **Agent Completes Task** → You get notification in Slack
2. **Send Voice Note** → Reply in thread with feedback
3. **Process Feedback**:
```
@Cursor extract improvements from my voice note above and create action items
```

## 💡 Pro Tips

### Use Thread Context
The agent reads the entire thread, so you can discuss with your team first:
```
Team Member: "The analysis looks good but prompts are too long"
You: "Yeah, and we need better quote formatting"
@Cursor update the analysis templates based on our discussion
```

### Chain Operations
```
@Cursor analyze jack-bricknell transcripts, then create segment profiles, then generate email templates for each segment
```

### Set Channel Defaults
```
@Cursor settings
# Set default repository to your ScaleStream repo
# Now you don't need [repo=...] every time
```

## 📊 Example Full Workflow

```slack
You: @Cursor analyze the 20 transcripts for acme-corp client

Cursor: ⏳ Starting analysis...
[... time passes ...]
Cursor: ✅ Analysis complete! Created:
- analysis/batch-1-results.md
- analysis/batch-2-results.md  
- analysis/batch-3-results.md
- analysis/batch-4-results.md
- analysis/segment-synthesis-prompt.md

You: [Voice note]: "Great work! The segment identification was perfect. What needs improvement: the prompts are about 30% too long, and I'd like a summary section at the top of each batch. Also, let's add a competitive insights section."

You: @Cursor process my voice feedback and update the analysis templates

Cursor: ✅ Updated templates with:
- 30% more concise prompts
- Summary section added
- Competitive insights section added
- Created: improvements/2024-01-15-analysis-feedback.md

You: @Cursor now generate content for all three awareness segments

Cursor: ⏳ Generating content...
✅ Created content for:
- problem-aware: 5 emails, 3 SMS
- solution-aware: 5 emails, 3 SMS  
- product-aware: 5 emails, 3 SMS
```

## 🔧 Settings Recommendations

1. **Set Default Repository**
   ```
   @Cursor settings
   # Set to your ScaleStream repo
   ```

2. **Configure Privacy**
   - Enable "Display Agent Summary" for transparency
   - Consider privacy settings based on client data sensitivity

3. **Use Options When Needed**
   ```
   @Cursor [model=o3, branch=dev] complex analysis task
   ```

## 📁 Background Agent Advantages

1. **Long Running Tasks** - Agents run in background, no timeout
2. **Context Aware** - Reads entire thread for context
3. **Team Collaboration** - Everyone can see progress
4. **Automatic PRs** - Can create PRs with changes
5. **Visual Summaries** - Shows diffs and changes

## 🎯 Quick Reference

| Task | Command |
|------|---------|
| New Client | `@Cursor create client folder for [name]` |
| Analyze | `@Cursor analyze [client] transcripts` |
| Generate Content | `@Cursor generate [awareness] content for [client]` |
| Process Feedback | `@Cursor extract improvements from voice note above` |
| List Tasks | `@Cursor list my agents` |

That's it! Much simpler than webhooks - just use @Cursor directly in Slack! 🚀