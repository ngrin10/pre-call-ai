# 📁 Data Folder Structure

This folder contains all client data, analyses, and generated content organized by client and awareness level.

---

## 📂 Folder Organization

```
/data/
├── /clients/
│   ├── /client-name-1/
│   │   ├── /transcripts/
│   │   │   ├── call-001.txt
│   │   │   ├── call-002.txt
│   │   │   └── ...
│   │   ├── /analysis/
│   │   │   ├── forensic-analysis.json
│   │   │   ├── awareness-segments.json
│   │   │   └── industry-research.json
│   │   ├── /content/
│   │   │   ├── /problem-aware/
│   │   │   │   ├── email-sequence.md
│   │   │   │   ├── sms-flow.md
│   │   │   │   └── trust-assets.md
│   │   │   ├── /solution-aware/
│   │   │   │   ├── email-sequence.md
│   │   │   │   ├── sms-flow.md
│   │   │   │   └── trust-assets.md
│   │   │   └── /product-aware/
│   │   │       ├── email-sequence.md
│   │   │       ├── sms-flow.md
│   │   │       └── trust-assets.md
│   │   └── /performance/
│   │       ├── metrics.json
│   │       └── optimization-log.md
│   └── /client-name-2/
│       └── [Same structure]
├── /templates/
│   ├── /industry-templates/
│   │   ├── professional-services.md
│   │   ├── saas.md
│   │   └── ecommerce.md
│   └── /awareness-templates/
│       ├── problem-aware-content.md
│       ├── solution-aware-content.md
│       └── product-aware-content.md
└── /knowledge-base/
    ├── patterns.json
    ├── winning-content.md
    └── optimization-insights.md
```

---

## 📋 File Naming Conventions

### Transcripts
- **Format**: `call-XXX.txt` or `transcript-YYYY-MM-DD.txt`
- **Content**: Raw sales call transcripts
- **Purpose**: Source material for forensic analysis

### Analysis Files
- **forensic-analysis.json**: Complete forensic analysis output
- **awareness-segments.json**: Extracted segment profiles
- **industry-research.json**: Industry and competitor intelligence

### Content Files
- **email-sequence.md**: Complete email sequences by awareness level
- **sms-flow.md**: SMS conversation flows
- **trust-assets.md**: Trust asset outlines and content

### Performance Files
- **metrics.json**: Performance data by awareness level
- **optimization-log.md**: Ongoing optimization notes and results

---

## 🏗️ Client Setup Process

### 1. Create Client Folder
```bash
mkdir data/clients/[client-name]
mkdir data/clients/[client-name]/transcripts
mkdir data/clients/[client-name]/analysis
mkdir data/clients/[client-name]/content
mkdir data/clients/[client-name]/content/problem-aware
mkdir data/clients/[client-name]/content/solution-aware
mkdir data/clients/[client-name]/content/product-aware
mkdir data/clients/[client-name]/performance
```

### 2. Upload Transcripts
- Place all sales call transcripts in `/transcripts/`
- Use consistent naming convention
- Include metadata in filename if helpful

### 3. Run Analysis
- Generate forensic analysis using the master prompt
- Save structured output in `/analysis/`
- Include awareness segment breakdown

### 4. Create Content
- Generate awareness-specific content
- Organize by awareness level in `/content/`
- Include all sequences and assets

### 5. Track Performance
- Monitor metrics by awareness level
- Save optimization insights
- Update knowledge base with learnings

---

## 📊 Data Standards

### Transcript Format
```
Prospect: [Quote]
Rep: [Response]
Prospect: [Quote]
Rep: [Response]
...

[Metadata]
Date: YYYY-MM-DD
Industry: [Industry]
Deal Size: $[Amount]
Outcome: [Showed/No-show/Closed/Lost]
```

### Analysis Format (JSON)
```json
{
  "clientName": "Client Name",
  "analysisDate": "YYYY-MM-DD",
  "transcriptsAnalyzed": 12,
  "awarenessBreakdown": {
    "problemAware": 67,
    "solutionAware": 25,
    "productAware": 8
  },
  "segments": [
    {
      "name": "Segment Name",
      "awarenessLevel": "problem-aware",
      "percentage": 45,
      "characteristics": [],
      "quotes": [],
      "messaging": {}
    }
  ]
}
```

### Performance Format (JSON)
```json
{
  "client": "Client Name",
  "period": "2024-01",
  "metrics": {
    "problemAware": {
      "showRate": 0.72,
      "emailOpenRate": 0.45,
      "responseRate": 0.18
    },
    "solutionAware": {
      "showRate": 0.78,
      "emailOpenRate": 0.62,
      "responseRate": 0.34
    },
    "productAware": {
      "showRate": 0.85,
      "emailOpenRate": 0.78,
      "responseRate": 0.56
    }
  }
}
```

---

## 🔄 Continuous Learning Loop

### Knowledge Base Updates
- Patterns that work across clients
- Industry-specific insights
- Optimization discoveries
- Template improvements

### Cross-Client Intelligence
- Awareness distribution patterns
- Successful content frameworks
- Common objection patterns
- Industry benchmarks

### Performance Optimization
- A/B test results
- Spectrum movement tracking
- Content effectiveness data
- Segmentation refinements

---

## 🛡️ Data Security

### Sensitive Information
- Remove client names from transcripts if needed
- Use company codes for confidential projects
- Exclude personally identifiable information
- Maintain client confidentiality

### Backup Strategy
- Regular backups of all client data
- Version control for content iterations
- Archive completed projects
- Maintain access logs

---

*This data structure supports the continuous learning loop that makes the V3.0 system increasingly effective over time.* 