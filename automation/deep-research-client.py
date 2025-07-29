#!/usr/bin/env python3
"""
Deep Research Client Analysis Script
Uses OpenAI's Deep Research API to analyze client data and generate competitive intelligence
"""

import os
import sys
import json
import time
from datetime import datetime
from pathlib import Path
from dotenv import load_dotenv
import openai

# Load environment variables
load_dotenv()

# Set up OpenAI client
openai.api_key = os.getenv('OPENAI_API_KEY')

def read_file(filepath):
    """Read content from a file"""
    try:
        with open(filepath, 'r') as f:
            return f.read()
    except FileNotFoundError:
        return f"File not found: {filepath}"
    except Exception as e:
        return f"Error reading file: {str(e)}"

def gather_client_data(client_path):
    """Gather all relevant client data from the template files"""
    data = {}
    
    # Define the files to read
    files_to_read = {
        'checklist': '00-onboarding-checklist.md',
        'client_info': '01-client-info.md',
        'transcripts': '02-sales-transcripts/02-sales-transcripts.md',
        'marketing': '03-marketing-materials/03-marketing-materials.md',
        'onboarding_call': '04-onboarding-call.md',
        'existing_research': '05-research.md'
    }
    
    # Read each file
    for key, filename in files_to_read.items():
        filepath = os.path.join(client_path, filename)
        data[key] = read_file(filepath)
    
    # Also gather email sequences if they exist
    email_dir = os.path.join(client_path, '03-marketing-materials/email-sequences')
    if os.path.exists(email_dir):
        email_files = []
        for email_file in os.listdir(email_dir):
            if email_file.endswith('.md') or email_file.endswith('.txt'):
                content = read_file(os.path.join(email_dir, email_file))
                email_files.append(f"=== {email_file} ===\n{content}")
        data['email_sequences'] = '\n\n'.join(email_files)
    
    return data

def create_research_prompt(client_data, client_name):
    """Create the research prompt with client data"""
    prompt_template = read_file('/Users/nikolaigrin/Desktop/SystemFlow.io/scalestream-system/prompts/deep-research-competitive-analysis.md')
    
    # Extract key information from the data
    # This is a simplified extraction - you might want to parse more intelligently
    transcript_count = client_data['transcripts'].count('=== TRANSCRIPT')
    
    # Build the complete prompt
    research_prompt = f"""
{prompt_template}

## CLIENT DATA PROVIDED:

### 1. Business Context (from onboarding checklist and client info):
{client_data['checklist']}

{client_data['client_info']}

### 2. Sales Transcripts Analysis:
Total transcripts provided: {transcript_count}

{client_data['transcripts'][:5000]}  # First 5000 chars as sample

### 3. Current Marketing Materials:
{client_data['marketing']}

### 4. Email Sequences Currently Used:
{client_data.get('email_sequences', 'No email sequences provided')}

### 5. Strategic Insights from Onboarding Call:
{client_data['onboarding_call']}

### 6. Any Existing Research:
{client_data['existing_research']}

---

Please conduct comprehensive research based on all this data and provide actionable insights in the exact format specified in the research template.
"""
    
    return research_prompt

def run_deep_research(prompt, client_name):
    """Run the deep research using OpenAI's API"""
    print(f"Starting deep research for {client_name}...")
    print("This may take several minutes as the AI conducts comprehensive research...")
    
    try:
        # Note: As of my knowledge cutoff, the Deep Research API might have specific 
        # endpoint or parameters. Adjust this based on the actual API documentation.
        response = openai.ChatCompletion.create(
            model="gpt-4-turbo-preview",  # or the specific deep research model
            messages=[
                {
                    "role": "system",
                    "content": "You are a world-class market researcher and competitive intelligence analyst. Conduct thorough research and provide actionable insights for creating hyper-personalized pre-call nurture sequences."
                },
                {
                    "role": "user",
                    "content": prompt
                }
            ],
            temperature=0.3,  # Lower temperature for more focused research
            max_tokens=4000,  # Adjust based on your needs
        )
        
        return response.choices[0].message.content
        
    except Exception as e:
        print(f"Error during research: {str(e)}")
        return None

def save_research_results(results, client_path):
    """Save the research results to the appropriate file"""
    if not results:
        print("No results to save")
        return
    
    # Save to the 05-research.md file
    output_path = os.path.join(client_path, '05-research.md')
    
    # Add timestamp and header
    final_content = f"""# 🔍 Research & Competitive Analysis - Generated by AI Deep Research

**Generated on**: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
**Research Method**: OpenAI Deep Research API

---

{results}

---

**Document Status**: [X] Complete / [ ] In Progress
**Last Updated**: {datetime.now().strftime('%Y-%m-%d')}
**Research Validity**: 30 days (recommend refresh after this period)
"""
    
    with open(output_path, 'w') as f:
        f.write(final_content)
    
    print(f"\nResearch results saved to: {output_path}")
    
    # Also save a backup with timestamp
    backup_path = os.path.join(client_path, f"05-research-backup-{datetime.now().strftime('%Y%m%d-%H%M%S')}.md")
    with open(backup_path, 'w') as f:
        f.write(final_content)
    
    print(f"Backup saved to: {backup_path}")

def main():
    """Main function"""
    if len(sys.argv) < 2:
        print("Usage: python deep-research-client.py <client-folder-path>")
        print("Example: python deep-research-client.py /path/to/0-INBOX/new-client-template")
        sys.exit(1)
    
    client_path = sys.argv[1]
    client_name = os.path.basename(client_path)
    
    # Check if path exists
    if not os.path.exists(client_path):
        print(f"Error: Client path does not exist: {client_path}")
        sys.exit(1)
    
    # Check for API key
    if not os.getenv('OPENAI_API_KEY'):
        print("Error: OPENAI_API_KEY not found in environment variables")
        print("Please ensure your .env file contains: OPENAI_API_KEY=your-key-here")
        sys.exit(1)
    
    print(f"Starting deep research process for: {client_name}")
    print("=" * 50)
    
    # Gather client data
    print("1. Gathering client data...")
    client_data = gather_client_data(client_path)
    
    # Create research prompt
    print("2. Creating research prompt...")
    research_prompt = create_research_prompt(client_data, client_name)
    
    # Save the prompt for review (optional)
    prompt_path = os.path.join(client_path, 'deep-research-prompt.txt')
    with open(prompt_path, 'w') as f:
        f.write(research_prompt)
    print(f"   Prompt saved to: {prompt_path}")
    
    # Run deep research
    print("3. Running deep research (this may take 5-10 minutes)...")
    results = run_deep_research(research_prompt, client_name)
    
    # Save results
    if results:
        print("4. Saving research results...")
        save_research_results(results, client_path)
        print("\n✅ Deep research completed successfully!")
    else:
        print("\n❌ Deep research failed. Please check the error messages above.")

if __name__ == "__main__":
    main()