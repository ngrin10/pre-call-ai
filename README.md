# 🚀 ScaleStream Pre-Call AI System

An intelligent system for analyzing sales transcripts and generating hyper-personalized pre-call nurture sequences that dramatically improve show rates.

## 🎯 What This Does

ScaleStream uses forensic analysis of your sales transcripts to:
- Identify distinct prospect awareness segments (Problem/Solution/Product Aware)
- Extract exact language patterns and objections
- Generate personalized email & SMS sequences for each segment
- Improve show rates by 15-50% through strategic pre-call nurturing

## 📊 System Overview

```
Sales Transcripts → AI Analysis → Segment Profiles → Personalized Content → Higher Show Rates
```

## 🏗️ Project Structure

```
scalestream-system/
├── 0-INBOX/                    # Unified onboarding system
│   ├── MASTER-ONBOARDING-SYSTEM.md
│   ├── new-client-template/    # Templates for new clients
│   └── examples/               # Reference implementations
├── automation/                 # Core automation scripts
│   ├── quick-commands.sh       # Main CLI interface
│   ├── process-transcripts.sh  # Transcript analysis
│   ├── generate-content.sh     # Content generation
│   └── generate-client-claude-md.sh
├── data/                       # Client data directory
│   └── clients/               # Individual client folders
├── prompts/                    # Analysis prompts
├── templates/                  # Content templates
├── sops/                       # Standard operating procedures
├── tools/                      # Utility scripts
└── web-interface/             # Web UI design (future)
```

## 🚀 Quick Start

### Prerequisites
- Bash shell (Mac/Linux)
- Text editor
- Claude AI access (for analysis)

### 1. Create New Client
```bash
./automation/quick-commands.sh new acme-corp
```

### 2. Configure Client
Edit the generated files:
- `data/clients/acme-corp/client-brief.md` - Business context
- `data/clients/acme-corp/client-config.yaml` - System configuration

### 3. Generate Custom Analysis Instructions
```bash
./automation/quick-commands.sh setup acme-corp
```

### 4. Add Transcripts
Place transcript batches (5 per file) in:
`data/clients/acme-corp/transcripts/batch-1.md`

### 5. Run Analysis
```bash
./automation/quick-commands.sh analyze acme-corp
```

### 6. Generate Content
```bash
./automation/quick-commands.sh content acme-corp problem-aware
./automation/quick-commands.sh content acme-corp solution-aware
./automation/quick-commands.sh content acme-corp product-aware
```

## 📋 Complete Workflow

See `0-INBOX/MASTER-ONBOARDING-SYSTEM.md` for the complete step-by-step process.

## 🎯 Key Commands

```bash
# Quick commands
./quick new [client]        # Start new client
./quick setup [client]      # Generate CLAUDE.md
./quick analyze [client]    # Run full analysis
./quick content [client] [awareness]  # Generate content
./quick status [client]     # Check progress
./quick check [client]      # Quality gates
```

## 📊 Expected Results

- **Show Rate Improvement**: 15-50% increase
- **Implementation Time**: 3 weeks from start to optimization
- **Content Output**: 
  - 5-7 emails for Problem Aware
  - 4-5 emails for Solution Aware  
  - 2-3 emails for Product Aware
  - SMS flows for each segment

## 🔧 Advanced Configuration

### Custom Analysis Parameters
Edit `templates/client-config-template.yaml` to modify:
- Batch sizes
- Awareness stage definitions
- Competitor tracking
- Output paths

### Adding New Automations
Create scripts in `automation/` following the existing patterns.

## 📚 Documentation

- **Methodology**: `sops/v3-methodology.md`
- **Examples**: `examples/winning/`
- **Templates**: `templates/`
- **Onboarding**: `0-INBOX/MASTER-ONBOARDING-SYSTEM.md`

## 🚨 Important Notes

1. **Minimum Requirements**: 15+ sales transcripts required
2. **Quality First**: The system enforces quality gates at each step
3. **Data Privacy**: Client transcripts are stored locally only
4. **Manual Analysis**: Claude AI analysis step requires manual intervention

## 🔮 Future Enhancements

- Web-based UI (see `web-interface/` for designs)
- Automated Claude API integration
- Real-time performance tracking
- A/B testing framework

## 📧 Support

For questions or issues, refer to:
- `docs/` - System documentation
- `examples/` - Working examples
- `tools/` - Troubleshooting utilities

---

Built with ❤️ for sales teams who demand better show rates.