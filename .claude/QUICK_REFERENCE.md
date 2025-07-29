# Claude Code Workflow - Quick Reference

## 🚀 New Features Overview

### 1. Plan/Review Mode
- **Always start with planning** before implementing features
- Plans saved to `.claude/tasks/[task-name].md`
- Use Shift+Tab twice to enter plan mode

### 2. Change Logging
```bash
# Log changes easily
./claude/scripts/log-change.sh create <file> <task> <reason>
./claude/scripts/log-change.sh edit <file> <task> <reason>
./claude/scripts/log-change.sh summary <task>

# View all changes for a task
./claude/scripts/log-change.sh task <task-id>
```

### 3. Feedback System
```bash
# Capture feedback interactively
./claude/scripts/feedback.sh quick

# View feedback analysis
./claude/scripts/feedback.sh analyze

# See pending improvements
./claude/scripts/feedback.sh pending
```

### 4. Hooks (Automatic)
- **stop-hook**: Plays notification when tasks complete
- **post-edit-hook**: Auto type-checking after file edits
- **feedback-hook**: Prompts for feedback after major tasks

### 5. Custom Commands
Type `/` followed by:
- `/analyze` - Deep codebase analysis
- `/improve` - Iterative improvement workflow
- `/review` - Code review checklist
- `/scalestream` - ScaleStream-specific workflows

## 📁 Directory Structure
```
.claude/
├── tasks/          # Task plans and tracking
├── commands/       # Custom slash commands
├── hooks/          # Automation hooks
├── scripts/        # Utility scripts
└── logs/           # Change logs and feedback
    ├── changes.json
    ├── changes_YYYY-MM-DD.md
    ├── feedback.md
    └── feedback_metrics.json
```

## 🔄 Typical Workflow

1. **Start with a plan**: Enter plan mode, create task document
2. **Track changes**: All edits automatically logged
3. **Get notifications**: Hooks provide automation
4. **Capture feedback**: After tasks, record what worked/didn't
5. **Iterate**: Use feedback to improve process

## 💡 Tips

- Use `--think` flag for complex analysis
- Run `/analyze` periodically for code health
- Check `feedback.sh analyze` for trends
- Custom commands stack with other features

## 🎯 ScaleStream Integration

The system now tracks:
- All file modifications
- Task completion metrics
- Improvement opportunities
- Workflow effectiveness

Perfect for maintaining quality and consistency in the ScaleStream automation pipeline!