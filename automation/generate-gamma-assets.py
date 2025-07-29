#!/usr/bin/env python3
"""
Gamma API Integration for ScaleStream
Generates visual sales assets based on analysis results and email content
"""

import os
import sys
import json
import time
import requests
from datetime import datetime
from pathlib import Path
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Gamma API configuration
GAMMA_API_KEY = os.getenv('GAMMA_API_KEY')
GAMMA_API_URL = "https://api.gamma.app/public-api/v0.1/generations"

def read_file(filepath):
    """Read content from a file"""
    try:
        with open(filepath, 'r') as f:
            return f.read()
    except FileNotFoundError:
        return ""
    except Exception as e:
        return f"Error reading file: {str(e)}"

def create_problem_aware_deck(client_data, segment_data):
    """Create educational deck for problem-aware prospects"""
    
    # Extract key pain points and education needs
    pain_points = segment_data.get('problem_aware', {}).get('pain_points', [])
    industry = client_data.get('industry', 'your industry')
    company_name = client_data.get('company_name', 'Our Company')
    
    # Using the winning ScaleStream structure pattern
    input_text = f"""
    Title: The Real Problem Most {industry} Teams Ignore
    Subtitle: The hidden revenue leak that's costing you 6-7 figures annually
    
    Slide 1: The Real Problem Most Teams Ignore
    - It's not {pain_points[0] if pain_points else 'lead flow'}
    - It's not {pain_points[1] if len(pain_points) > 1 else 'your team'}
    - It's not {pain_points[2] if len(pain_points) > 2 else 'your process'}
    - It's the gap between [specific business stages]
    - {pain_points[0] if pain_points else 'Prospects'} [specific negative behavior]
    - Sound familiar?
    - That "gap" is where your revenue is leaking
    
    Slide 2: Why It Matters
    - Every day, {industry} teams lose deals because:
    - • [Specific pain point with emotional impact]
    - • [Another pain point they don't realize]
    - • [Time/money waste they experience]
    - • [Inefficiency that frustrates them]
    - It drags out [specific business metric]
    - It burns [specific resource]
    - And it costs you 6, if not 7 figures per year
    
    Slide 3: The Hidden Costs You Don't See
    - Direct cost: [Specific monetary loss]
    - Opportunity cost: [What they could be doing instead]
    - Team cost: [Impact on morale/efficiency]
    - Competitive cost: [How competitors are winning]
    - Compound effect over 12 months
    
    Slide 4: Why Traditional Solutions Fall Short  
    - The "[common solution]" approach: Why it fails
    - The "[another solution]" trap: What really happens
    - The band-aid fixes that make it worse
    - Why throwing more [resource] at it doesn't work
    
    Slide 5: A Different Approach That Actually Works
    - Not another [thing they're tired of]
    - Not more [resource they don't have]
    - Just simple [category] that [specific benefit]
    - Here's how it works: [3-step overview]
    
    Slide 6: Real {industry} Results (Proven & Documented)
    - [Similar Company]: [Specific before → after metric]
    - [Another Company]: [Different impressive metric]
    - [Third Example]: [Time-based improvement]
    - All without [thing they fear doing]
    
    Slide 7: The Revenue Leakage Calculator
    - Your current [metric]: ___
    - Industry average improvement: [X%]
    - Your potential gain: $[calculation]
    - Timeline to results: [specific timeframe]
    - ROI multiple: [X]x in [timeframe]
    
    Slide 8: Your Free [Industry] Audit
    - Map your current [process]
    - Identify exactly where you're leaking revenue
    - Calculate what those leaks are costing you
    - Get a custom implementation plan
    - See if this makes sense for your business
    - Book here: [clear CTA]
    """
    
    return {
        "inputText": input_text,
        "tone": "educational and empathetic",
        "audience": f"{industry} professionals experiencing {pain_points[0] if pain_points else 'common challenges'}",
        "textAmount": "medium",
        "textMode": "generate",
        "numCards": 8,
        "imageModel": "flux-1-pro",
        "imageStyle": "professional business photography",
        "editorMode": "freeform",
        "additionalInstructions": "Make it educational, not salesy. Focus on problem education.",
        "themeName": "chisel",
        "workspaceAccess": "view",
        "externalAccess": "view",
        "exportAs": "pdf"
    }

def create_solution_aware_deck(client_data, segment_data):
    """Create comparison deck for solution-aware prospects"""
    
    competitors = client_data.get('competitors', [])
    differentiators = client_data.get('differentiators', [])
    solution_category = client_data.get('solution_category', 'solution')
    industry = client_data.get('industry', 'your industry')
    
    # Using the 3-part infrastructure pattern from winning example
    input_text = f"""
    Title: The 3 Critical Parts of a {solution_category} That Actually Works
    Subtitle: What separates the top 1% from everyone else
    
    Slide 1: The Truth About {solution_category} Solutions
    - This isn't a [generic tool], a [band-aid], or a [quick fix]
    - It's a revenue activation layer designed to [specific outcome]
    - Most {solution_category} providers miss 2 of the 3 critical parts
    - Here's what actually drives results...
    
    Slide 2: Part 1: [First Critical Component]
    - What it does: [Specific function and benefit]
    - Why others fail: [Common mistake competitors make]
    - Expected result: [Specific metric improvement]
    - Real example: [Quick case study snippet]
    - → Your [metric] should [specific improvement]
    
    Slide 3: Part 2: [Second Critical Component]
    - What happens after [first component]?
    - If you're not [doing this], you're leaking revenue
    - Our approach: [Specific methodology]
    - Common alternative: [What competitors do] (why it fails)
    - Expected result: [Specific improvement]
    - → [Benefit statement with metric]
    
    Slide 4: Part 3: [Third Critical Component]
    - Get better [results], not just more [inputs]
    - Turn more of your [asset] into [desired outcome]
    - Perfect if: [Specific pain point they have]
    - How we're different: [Key differentiator]
    - Expected result: [Specific metric]
    - → [Final benefit with ROI]
    
    Slide 5: The Revenue Impact Comparison
    - Basic {solution_category}: [Lower results]
    - Advanced {solution_category}: [Medium results]
    - Our 3-Part System: [Superior results]
    - Time to results: [Faster timeline]
    - Required resources: [Less/same resources]
    - Risk level: [Lower risk]
    
    Slide 6: Who This Is For vs. Not For
    - ✅ Perfect for: [Ideal customer criteria 1-4]
    - ✅ You know you're [specific problem awareness]
    - ✅ You want to [specific desired outcome]
    - ❌ Not for: [Disqualifiers 1-3]
    - ❌ You're still [early stage indicator]
    - ❌ You don't have [minimum requirement]
    
    Slide 7: Implementation: How It Actually Works
    - Week 1: [Audit/Discovery phase]
    - Weeks 2-3: [Build/Implementation phase]
    - Week 4: [Launch/Training phase]
    - Ongoing: [Optimization/Support]
    - No disruption to current operations
    - Your team stays focused on [their priority]
    
    Slide 8: See If You Qualify
    - Free {solution_category} System Audit includes:
    - 1. Map your current [process]
    - 2. Identify gaps costing you revenue
    - 3. Show you the 3-part system in action
    - 4. Calculate your specific ROI
    - 5. See if we're a fit to work together
    - Limited to [X] businesses per month
    - Book your audit: [CTA]
    """
    
    return {
        "inputText": input_text,
        "tone": "consultative and objective",
        "audience": f"buyers evaluating {client_data.get('solution_category', 'solutions')}",
        "textAmount": "detailed",
        "textMode": "generate",
        "numCards": 8,
        "imageModel": "flux-1-pro",
        "imageStyle": "clean infographics and charts",
        "editorMode": "freeform",
        "additionalInstructions": "Position as objective buyer's guide, not promotional",
        "themeName": "clarity",
        "workspaceAccess": "view",
        "externalAccess": "view",
        "exportAs": "pdf"
    }

def create_product_aware_deck(client_data, segment_data):
    """Create product-specific deck for product-aware prospects"""
    
    company_name = client_data.get('company_name', 'Our Company')
    unique_advantages = client_data.get('unique_advantages', [])
    industry = client_data.get('industry', 'your industry')
    main_metric = client_data.get('main_metric', 'revenue')
    
    # Using the direct, results-focused pattern from winning example
    input_text = f"""
    Title: {company_name} Pre-Call OS
    Subtitle: Double Your {main_metric} From the [Assets] You're Already [Creating]
    Tagline: Without [common objection] or [another objection]
    
    Slide 1: Who's Behind This?
    - Personal credibility: After [specific experience]
    - Problem I kept seeing: [List of 4-5 specific problems]
    - Instead of [what others do], I [unique approach]
    - The results: [Specific transformation achieved]
    - Now I [what you do for clients]
    - Let's see if it makes sense for yours
    
    Slide 2: Real Client Results (Proven Across Industries)
    - Industry | Before | After | Impact
    - {industry} Example 1: $[X] → $[Y] in [timeframe] | [Multiplier]x
    - {industry} Example 2: [Metric]% → [Metric]% | [Specific benefit]
    - {industry} Example 3: [Time] → [Time] | [Efficiency gain]
    - All without [thing they fear]
    - View detailed case studies: [Link]
    
    Slide 3: The Revenue Leakage (Your Situation)
    - Funnel Stage | You Now | Industry Best | Your Gap
    - [Stage 1]: [Current]% | [Best]% | Missing [X] [units]/mo
    - [Stage 2]: [Current]% | [Best]% | Missing $[amount]/mo
    - [Stage 3]: [Current]% | [Best]% | Missing [metric]
    - Total Revenue Gap: $[amount]/month
    - That's ~[multiplier]x more MRR without adding a single [resource]
    
    Slide 4: What We Install (Not What You Think)
    - Component 1: [Specific deliverable]
    - Component 2: [Specific deliverable]  
    - Component 3: [Specific deliverable]
    - Component 4: [Specific deliverable]
    - Expected Results:
    - ✅ [Specific metric improvement]
    - ✅ [Specific efficiency gain]
    - ✅ [Specific quality improvement]
    
    Slide 5: How It Actually Looks (See It In Action)
    - [Visual representation or screenshot]
    - Before: [Current state description]
    - After: [Future state description]
    - Timeline: [Specific implementation timeline]
    - Your team's involvement: [Minimal/specific]
    
    Slide 6: Creating Enterprise Value (Beyond Revenue)
    - 1. Your [process] works whether you're there or not
    - 2. You can confidently scale [metric] knowing your [metric]
    - 3. Your revenue becomes predictable instead of [current state]
    - 4. Your business becomes less dependent on [risk factor]
    - 5. You build real enterprise value with proprietary [asset]
    - This isn't just about making more money today
    
    Slide 7: Our Implementation Process (Done For You)
    - Week 1 (Audit): Map your [process], identify leaks, clarify roadmap
    - Weeks 2-3 (Build): Fully build [deliverables] tailored to your needs
    - Week 4 (Launch): Launch, train your team, start seeing results
    - Beyond (Optimize): Continuous improvements based on your data
    - This isn't DIY or templates - we build it all custom for you
    
    Slide 8: Bottom Line + Your Next Step
    - This is real. It works consistently.
    - It's not complicated.
    - Just [simple description] applied to [specific area]
    - Free [Industry] System Audit:
    - • Map your current [process]
    - • Calculate revenue leakage  
    - • Get custom implementation plan
    - • See if we're a fit
    - Book your audit: [Specific CTA]
    """
    
    return {
        "inputText": input_text,
        "tone": "confident and results-focused",
        "audience": f"qualified prospects considering {company_name}",
        "textAmount": "medium",
        "textMode": "generate",
        "numCards": 8,
        "imageModel": "flux-1-pro",
        "imageStyle": "premium corporate photography",
        "editorMode": "freeform",
        "additionalInstructions": "Confident but not arrogant. Focus on proof and results.",
        "themeName": "executive",
        "workspaceAccess": "view",
        "externalAccess": "view",
        "exportAs": "pdf"
    }

def create_case_study_deck(client_data, case_study):
    """Create a visual case study presentation"""
    
    input_text = f"""
    Title: {case_study.get('client_name', 'Client')} Success Story: {case_study.get('headline_result', 'Remarkable Results')}
    
    Slide 1: The Challenge
    - Company background
    - Specific problems they faced
    - What they tried before
    - Why it wasn't working
    
    Slide 2: The Turning Point
    - How they found us
    - Initial conversation insights
    - Their biggest concerns
    - Decision factors
    
    Slide 3: Our Solution
    - Customized approach
    - Key implementations
    - Timeline of rollout
    - Team involvement
    
    Slide 4: The Results
    - Before vs. After metrics
    - {case_study.get('primary_metric', 'Key improvement')}: {case_study.get('primary_result', 'X% increase')}
    - {case_study.get('secondary_metric', 'Secondary benefit')}: {case_study.get('secondary_result', 'Y% improvement')}
    - Time to achieve results
    
    Slide 5: Client Testimonial
    - Direct quote from client
    - Their favorite part
    - Unexpected benefits
    - Would they recommend?
    
    Slide 6: Key Takeaways
    - What made this work
    - Replicable strategies
    - Lessons learned
    - How this applies to similar businesses
    """
    
    return {
        "inputText": input_text,
        "tone": "storytelling and inspirational",
        "audience": "prospects in similar situations",
        "textAmount": "medium",
        "textMode": "generate",
        "numCards": 6,
        "imageModel": "flux-1-pro",
        "imageStyle": "documentary photography style",
        "editorMode": "freeform",
        "additionalInstructions": "Tell a compelling story with clear before/after",
        "themeName": "impact",
        "workspaceAccess": "view",
        "externalAccess": "view",
        "exportAs": "pdf"
    }

def call_gamma_api(payload):
    """Call Gamma API and handle response"""
    headers = {
        "Content-Type": "application/json",
        "X-API-KEY": GAMMA_API_KEY
    }
    
    try:
        # Initial request
        response = requests.post(GAMMA_API_URL, json=payload, headers=headers)
        response.raise_for_status()
        
        result = response.json()
        generation_id = result.get('id')
        
        if not generation_id:
            return None, "No generation ID received"
        
        # Poll for completion
        print(f"Generation started with ID: {generation_id}")
        print("Polling for completion...")
        
        max_attempts = 60  # 5 minutes max
        for attempt in range(max_attempts):
            time.sleep(5)  # Wait 5 seconds between polls
            
            poll_response = requests.get(
                f"{GAMMA_API_URL}/{generation_id}",
                headers=headers
            )
            poll_response.raise_for_status()
            
            status_data = poll_response.json()
            status = status_data.get('status')
            
            print(f"Status: {status}")
            
            if status == 'completed':
                return status_data, None
            elif status == 'failed':
                return None, "Generation failed"
        
        return None, "Generation timed out"
        
    except Exception as e:
        return None, str(e)

def generate_all_assets(client_name):
    """Generate all Gamma assets for a client"""
    client_path = f"/Users/nikolaigrin/Desktop/SystemFlow.io/scalestream-system/data/clients/{client_name}"
    
    # Read client data
    client_data = {
        'company_name': client_name,
        'client_brief': read_file(f"{client_path}/client-brief.md"),
        'segment_data': read_file(f"{client_path}/analysis/segment-synthesis.md"),
        'email_content': {
            'problem_aware': read_file(f"{client_path}/content/problem-aware/email-sequence.md"),
            'solution_aware': read_file(f"{client_path}/content/solution-aware/email-sequence.md"),
            'product_aware': read_file(f"{client_path}/content/product-aware/email-sequence.md")
        }
    }
    
    # Parse client data for key information
    # (In production, you'd parse these files more intelligently)
    
    results = {}
    
    # Generate Problem Aware Deck
    print("\n1. Generating Problem Aware Education Deck...")
    payload = create_problem_aware_deck(client_data, {})
    result, error = call_gamma_api(payload)
    if result:
        results['problem_aware_deck'] = result
        print(f"✅ Success: {result.get('docUrl')}")
    else:
        print(f"❌ Error: {error}")
    
    # Generate Solution Aware Deck
    print("\n2. Generating Solution Aware Comparison Guide...")
    payload = create_solution_aware_deck(client_data, {})
    result, error = call_gamma_api(payload)
    if result:
        results['solution_aware_deck'] = result
        print(f"✅ Success: {result.get('docUrl')}")
    else:
        print(f"❌ Error: {error}")
    
    # Generate Product Aware Deck
    print("\n3. Generating Product Aware Sales Deck...")
    payload = create_product_aware_deck(client_data, {})
    result, error = call_gamma_api(payload)
    if result:
        results['product_aware_deck'] = result
        print(f"✅ Success: {result.get('docUrl')}")
    else:
        print(f"❌ Error: {error}")
    
    # Save results
    output_path = f"{client_path}/content/gamma-assets.json"
    with open(output_path, 'w') as f:
        json.dump(results, f, indent=2)
    
    print(f"\n✅ All assets saved to: {output_path}")
    
    return results

def main():
    """Main function"""
    if len(sys.argv) < 2:
        print("Usage: python generate-gamma-assets.py <client-name>")
        sys.exit(1)
    
    client_name = sys.argv[1]
    
    # Check for API key
    if not GAMMA_API_KEY:
        print("Error: GAMMA_API_KEY not found in environment variables")
        print("Please add to .env file: GAMMA_API_KEY=sk-gamma-xxx")
        sys.exit(1)
    
    print(f"🎨 Generating Gamma visual assets for: {client_name}")
    print("=" * 50)
    
    results = generate_all_assets(client_name)
    
    print("\n📊 Summary of Generated Assets:")
    print("=" * 50)
    for asset_type, data in results.items():
        if data:
            print(f"\n{asset_type}:")
            print(f"  - Gamma URL: {data.get('docUrl')}")
            print(f"  - Export URL: {data.get('exportUrl')}")

if __name__ == "__main__":
    main()