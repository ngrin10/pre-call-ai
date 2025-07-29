# Configuration Directory

This directory contains configuration files for the ScaleStream system.

## Files

### `api-keys.env`
Contains all API keys and credentials. **NEVER commit this file to git.**

**Required API Keys:**
- `CLAUDE_API_KEY` - For Claude AI analysis
- `OPENAI_API_KEY` - For ChatGPT integration  
- `GHL_API_KEY` - For GoHighLevel automation
- `GHL_ACCOUNT_NAME` - Your GHL account name
- `GONG_API_KEY` - For Gong transcript access
- `GONG_WORKSPACE_ID` - Your Gong workspace ID
- `ZOOM_API_KEY` - For Zoom transcript access
- `ZOOM_API_SECRET` - Your Zoom API secret

## Usage

### Loading Environment Variables
```bash
# Load API keys in your scripts
source config/api-keys.env

# Or use in Python
import os
from dotenv import load_dotenv
load_dotenv('config/api-keys.env')
```

### Security Notes
- ✅ This file is in `.gitignore` - it won't be committed
- ✅ Keep a backup of your keys in a secure password manager
- ✅ Rotate keys regularly for security
- ❌ Never share these keys in chat or email
- ❌ Never commit them to any public repository

## Getting API Keys

### Claude API
1. Go to https://console.anthropic.com/
2. Create account and get API key
3. Add to `CLAUDE_API_KEY=`

### OpenAI API  
1. Go to https://platform.openai.com/api-keys
2. Create new API key
3. Add to `OPENAI_API_KEY=`

### GoHighLevel API
1. Login to your GHL account
2. Go to Settings → API
3. Generate API key
4. Add to `GHL_API_KEY=` and `GHL_ACCOUNT_NAME=`

### Gong API
1. Contact Gong support for API access
2. Get API key and workspace ID
3. Add to `GONG_API_KEY=` and `GONG_WORKSPACE_ID=`

### Zoom API
1. Go to https://marketplace.zoom.us/
2. Create app and get credentials
3. Add to `ZOOM_API_KEY=` and `ZOOM_API_SECRET=` 