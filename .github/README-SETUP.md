# 🚀 GitHub Setup for Cursor Slack Integration

## Why GitHub?
Cursor's Background Agents need a GitHub repository to:
- Track changes
- Create branches
- Make pull requests
- Store code while processing

## Quick Setup Steps

### 1. Create GitHub Repository
```bash
# Initialize git if not already
cd /Users/nikolaigrin/Desktop/SystemFlow.io/scalestream-system
git init

# Create .gitignore
cat > .gitignore << 'EOF'
# Client data (sensitive)
data/clients/*/transcripts/
data/clients/*/analysis/*-results.md
0-INBOX/*/02-sales-transcripts.md
0-INBOX/*/04-onboarding-call.md

# Sensitive config
.env
.claude/logs/
*.log

# Temporary files
*.tmp
.DS_Store

# Keep templates and structure
!data/clients/.gitkeep
!0-INBOX/new-client-template/**
EOF

# Add files
git add .
git commit -m "Initial ScaleStream system setup"
```

### 2. Create GitHub Repo
1. Go to https://github.com/new
2. Name: `scalestream-system` (or your preference)
3. Private repository ✓ (recommended for client data)
4. Don't initialize with README (we already have files)

### 3. Connect Local to GitHub
```bash
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/scalestream-system.git
git branch -M main
git push -u origin main
```

### 4. Configure Cursor Slack
1. In Slack: `@Cursor settings`
2. Select your repository: `YOUR_USERNAME/scalestream-system`
3. Branch: `main`
4. Save

## 🎯 Now You Can Use Commands Like:

```slack
@Cursor analyze jack-bricknell transcripts
@Cursor create improvements file from voice feedback
@Cursor generate content for problem-aware segment
```

## 📁 What to Commit vs Ignore

### ✅ Commit These:
- System files (automation scripts, templates)
- Prompts and frameworks
- Documentation
- Empty client folders with .gitkeep

### ❌ Don't Commit These:
- Actual client transcripts
- Analysis results
- Generated content
- Personal notes

## 🔒 Security Notes

1. **Keep Repo Private** - Contains business logic
2. **Use .gitignore** - Protects client data
3. **Branch Strategy** - Main for system, feature branches for updates
4. **Access Control** - Only add trusted team members