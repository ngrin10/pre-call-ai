# 🎨 Gamma API Integration Guide

## Overview
The Gamma API integration creates visual sales assets automatically based on your analysis results and email content. This eliminates hours of manual presentation creation while ensuring message consistency across all touchpoints.

## 🔄 Where Gamma Fits in the Workflow

```
1. ANALYZE: Extract awareness segments from transcripts
                        ↓
2. CONTENT: Generate email sequences for each segment
                        ↓
3. GAMMA: Create visual assets for each awareness level ← YOU ARE HERE
                        ↓
4. DEPLOY: Use presentations in nurture sequences
```

## 📊 What Gets Created

### 1. **Problem Aware Education Deck** (8 slides)
- Educational content about their industry problems
- Hidden costs and domino effects
- Why traditional solutions fail
- New way of thinking introduction
- **Use case**: Attach to email #3 in problem-aware sequence

### 2. **Solution Aware Comparison Guide** (8 slides)
- Buyer's checklist for evaluating solutions
- Hidden costs of different approaches
- What separates great from good
- ROI calculation framework
- **Use case**: Send after prospect shows solution interest

### 3. **Product Aware Sales Deck** (8 slides)
- Company story and differentiators
- Proven results and process
- Investment and ROI details
- Client success stories
- **Use case**: Pre-call asset or follow-up

### 4. **Case Study Presentations** (6 slides)
- Visual storytelling of client success
- Before/after transformation
- Specific metrics and testimonials
- **Use case**: Social proof in nurture sequences

## 🚀 Setup Instructions

### 1. Get Your Gamma API Key
1. Sign up at [gamma.app](https://gamma.app)
2. Go to Settings → API
3. Generate an API key (starts with `sk-gamma-`)

### 2. Add to Environment
```bash
echo 'GAMMA_API_KEY=sk-gamma-your-key-here' >> .env
```

### 3. Install Python Dependencies
```bash
pip install requests python-dotenv
```

## 💻 Usage

### Quick Command (Recommended)
```bash
./quick gamma [client-name]
```

### Direct Script
```bash
./automation/generate-gamma-assets.sh [client-name]
```

### What Happens
1. Reads your email sequences and analysis data
2. Creates prompts optimized for each awareness level
3. Calls Gamma API to generate presentations
4. Saves links and exports to `gamma-assets.json`
5. Each deck takes 30-60 seconds to generate

## 📝 Integration with Email Sequences

### Problem Aware Sequence Integration
```markdown
Email #3: "The Hidden Costs You're Not Seeing"
...
P.S. I put together a quick presentation showing the real 
impact of [problem]. Takes 5 minutes to review: [Gamma Link]
```

### Solution Aware Sequence Integration
```markdown
Email #2: "How to Choose the Right [Solution Category]"
...
Attached is our buyer's guide that breaks down exactly 
what to look for: [Gamma PDF Export]
```

### Product Aware Sequence Integration
```markdown
Email #1: "Your Personalized [Company] Overview"
...
I created a custom presentation based on our conversation.
Review it here before our call: [Gamma Link]
```

## 🎯 Customization Points

### 1. **Modify Deck Templates**
Edit functions in `generate-gamma-assets.py`:
- `create_problem_aware_deck()` - Education focus
- `create_solution_aware_deck()` - Comparison focus
- `create_product_aware_deck()` - Sales focus

### 2. **Adjust Visual Styles**
```python
"imageModel": "flux-1-pro",  # or dall-e-3, imagen-3-pro
"imageStyle": "professional business photography",
"themeName": "chisel",  # or clarity, executive, impact
```

### 3. **Control Access Levels**
```python
"workspaceAccess": "view",  # or comment, edit, full_access
"externalAccess": "view",   # or no_access, comment, edit
```

## 🔗 Advanced Integrations

### 1. **Auto-Attach to Emails**
Modify `generate-content.sh` to include Gamma links:
```bash
# After generating emails, create Gamma assets
./automation/generate-gamma-assets.sh "$CLIENT"

# Parse gamma-assets.json and insert links into emails
```

### 2. **Webhook Integration**
Use Gamma's polling API with webhooks:
```python
# Send generation ID to your webhook
webhook_url = "https://your-app.com/gamma-webhook"
requests.post(webhook_url, json={"id": generation_id})
```

### 3. **CRM Integration**
```python
# After generation, update CRM
crm_api.update_contact(
    contact_id,
    custom_fields={
        "problem_aware_deck": results['problem_aware_deck']['docUrl'],
        "solution_aware_deck": results['solution_aware_deck']['docUrl']
    }
)
```

## 📊 Metrics to Track

### Engagement Metrics
- Deck view rates vs email open rates
- Time spent viewing decks
- Slide completion rates
- Download rates for PDFs

### Conversion Impact
- Show rate improvement with decks
- Close rate for prospects who viewed decks
- Which deck type drives most engagement

## 🚨 Troubleshooting

### API Key Issues
```bash
# Test your API key
curl -X GET https://api.gamma.app/public-api/v0.1/test \
  -H "X-API-KEY: sk-gamma-your-key"
```

### Generation Timeouts
- Decks with many images take longer
- Use `"skipImageGeneration": true` for faster generation
- Images will load when deck is opened

### Rate Limits
- Max 100 presentations per day
- Space out bulk generations
- Consider upgrading for higher limits

## 💡 Best Practices

### 1. **Timing in Nurture Sequence**
- Problem Aware: Attach to email #3 (after problem agitation)
- Solution Aware: Send when they engage with comparison content
- Product Aware: Include in pre-call email

### 2. **Personalization**
- Use prospect's industry in titles
- Reference their specific pain points
- Include relevant case studies

### 3. **Follow-Up**
- Track deck engagement in CRM
- Trigger follow-up based on viewing behavior
- Reference specific slides in calls

## 🎉 Example Success Workflow

```bash
# 1. Complete analysis and content generation
./quick analyze acme-corp
./quick content acme-corp problem-aware
./quick content acme-corp solution-aware
./quick content acme-corp product-aware

# 2. Generate visual assets
./quick gamma acme-corp

# 3. Review generated assets
# - Check each deck for accuracy
# - Make minor edits in Gamma editor
# - Export PDFs for email attachments

# 4. Deploy in sequences
# - Add links to email templates
# - Set up tracking in CRM
# - Monitor engagement
```

## 📈 ROI of Visual Assets

Based on industry data:
- **43% higher email engagement** with visual content
- **2.3x more likely to book calls** after viewing presentations
- **67% of buyers** prefer visual content over text-only

Your time investment: 5 minutes
Manual creation time saved: 2-3 hours per client

---

**Remember**: The best visual asset is one that speaks directly to the prospect's awareness level. Let the data drive the content!