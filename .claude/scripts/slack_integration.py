#!/usr/bin/env python3
"""
Slack Integration for Claude Code Automation
Sends notifications and processes voice feedback
"""

import json
import os
import sys
import datetime
import subprocess
from pathlib import Path
from typing import Dict, List, Optional
import requests
import time

class SlackIntegration:
    def __init__(self, webhook_url: Optional[str] = None):
        """Initialize Slack integration
        
        Args:
            webhook_url: Slack webhook URL (or set SLACK_WEBHOOK_URL env var)
        """
        self.webhook_url = webhook_url or os.environ.get('SLACK_WEBHOOK_URL')
        self.log_dir = Path(".claude/logs/slack")
        self.log_dir.mkdir(parents=True, exist_ok=True)
        self.pending_file = self.log_dir / "pending_feedback.json"
        
    def send_notification(self, 
                         task_type: str,
                         task_name: str,
                         status: str,
                         details: Dict,
                         voice_feedback_requested: bool = True) -> bool:
        """Send notification to Slack
        
        Args:
            task_type: Type of task (analysis, content, etc)
            task_name: Name of the task
            status: Current status (completed, error, needs_review)
            details: Additional details about the task
            voice_feedback_requested: Whether to request voice feedback
        """
        
        if not self.webhook_url:
            print("Warning: No Slack webhook URL configured")
            return False
        
        # Build message blocks
        blocks = self._build_message_blocks(
            task_type, task_name, status, details, voice_feedback_requested
        )
        
        # Send to Slack
        response = requests.post(
            self.webhook_url,
            json={"blocks": blocks},
            headers={'Content-Type': 'application/json'}
        )
        
        success = response.status_code == 200
        
        # Log the notification
        self._log_notification({
            "timestamp": datetime.datetime.now().isoformat(),
            "task_type": task_type,
            "task_name": task_name,
            "status": status,
            "details": details,
            "sent_successfully": success,
            "voice_feedback_requested": voice_feedback_requested
        })
        
        # Track pending feedback if requested
        if success and voice_feedback_requested:
            self._track_pending_feedback(task_name, task_type)
        
        return success
    
    def _build_message_blocks(self, task_type: str, task_name: str, 
                             status: str, details: Dict, 
                             voice_feedback_requested: bool) -> List[Dict]:
        """Build Slack message blocks"""
        
        # Determine emoji based on status
        status_emoji = {
            "completed": "✅",
            "error": "❌",
            "needs_review": "👀",
            "in_progress": "🔄"
        }.get(status, "📌")
        
        # Header block
        blocks = [
            {
                "type": "header",
                "text": {
                    "type": "plain_text",
                    "text": f"{status_emoji} Claude Code: {task_type.title()} Update"
                }
            },
            {
                "type": "section",
                "fields": [
                    {
                        "type": "mrkdwn",
                        "text": f"*Task:*\n{task_name}"
                    },
                    {
                        "type": "mrkdwn",
                        "text": f"*Status:*\n{status.replace('_', ' ').title()}"
                    }
                ]
            }
        ]
        
        # Add details section
        if details:
            detail_text = self._format_details(details)
            blocks.append({
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f"*Details:*\n{detail_text}"
                }
            })
        
        # Add voice feedback request
        if voice_feedback_requested and status == "completed":
            blocks.extend([
                {"type": "divider"},
                {
                    "type": "section",
                    "text": {
                        "type": "mrkdwn",
                        "text": "🎤 *Voice Feedback Requested*\nPlease send a voice note with your feedback on:\n• What worked well\n• What needs improvement\n• Any specific changes needed"
                    }
                },
                {
                    "type": "context",
                    "elements": [
                        {
                            "type": "mrkdwn",
                            "text": f"Reply with voice note mentioning task ID: `{task_name}`"
                        }
                    ]
                }
            ])
        
        # Add file locations if available
        if "files_created" in details or "files_modified" in details:
            files_text = self._format_file_list(details)
            blocks.append({
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f"📁 *Files:*\n{files_text}"
                }
            })
        
        return blocks
    
    def _format_details(self, details: Dict) -> str:
        """Format details dictionary into readable text"""
        lines = []
        
        for key, value in details.items():
            if key not in ["files_created", "files_modified"]:
                formatted_key = key.replace("_", " ").title()
                if isinstance(value, list):
                    lines.append(f"• {formatted_key}: {', '.join(str(v) for v in value)}")
                else:
                    lines.append(f"• {formatted_key}: {value}")
        
        return "\n".join(lines)
    
    def _format_file_list(self, details: Dict) -> str:
        """Format file lists"""
        lines = []
        
        if "files_created" in details:
            lines.append("*Created:*")
            for file in details["files_created"]:
                lines.append(f"• `{file}`")
        
        if "files_modified" in details:
            lines.append("*Modified:*")
            for file in details["files_modified"]:
                lines.append(f"• `{file}`")
        
        return "\n".join(lines)
    
    def _log_notification(self, notification_data: Dict):
        """Log notification for tracking"""
        log_file = self.log_dir / f"notifications_{datetime.date.today()}.json"
        
        logs = []
        if log_file.exists():
            with open(log_file, 'r') as f:
                logs = json.load(f)
        
        logs.append(notification_data)
        
        with open(log_file, 'w') as f:
            json.dump(logs, f, indent=2)
    
    def _track_pending_feedback(self, task_name: str, task_type: str):
        """Track tasks pending voice feedback"""
        pending = {}
        
        if self.pending_file.exists():
            with open(self.pending_file, 'r') as f:
                pending = json.load(f)
        
        pending[task_name] = {
            "task_type": task_type,
            "timestamp": datetime.datetime.now().isoformat(),
            "status": "awaiting_feedback"
        }
        
        with open(self.pending_file, 'w') as f:
            json.dump(pending, f, indent=2)
    
    def process_voice_feedback(self, task_name: str, transcript: str) -> Dict:
        """Process voice feedback transcript
        
        Args:
            task_name: Name of the task the feedback is for
            transcript: Transcribed voice feedback
            
        Returns:
            Processed feedback with extracted insights
        """
        # Parse the transcript for key feedback elements
        feedback = {
            "task_name": task_name,
            "timestamp": datetime.datetime.now().isoformat(),
            "transcript": transcript,
            "what_worked": [],
            "what_needs_improvement": [],
            "action_items": [],
            "satisfaction_rating": None
        }
        
        # Simple keyword-based extraction (can be enhanced with AI)
        lines = transcript.lower().split('.')
        
        current_section = None
        for line in lines:
            line = line.strip()
            
            # Detect sections
            if any(phrase in line for phrase in ["what worked", "worked well", "good"]):
                current_section = "what_worked"
            elif any(phrase in line for phrase in ["improve", "better", "issue", "problem"]):
                current_section = "what_needs_improvement"
            elif any(phrase in line for phrase in ["action", "need to", "should", "must"]):
                current_section = "action_items"
            
            # Extract content
            elif current_section and len(line) > 10:
                feedback[current_section].append(line.capitalize())
        
        # Try to extract rating
        import re
        rating_match = re.search(r'(\d+)\s*(?:out of\s*)?(?:/\s*)?10', transcript)
        if rating_match:
            feedback["satisfaction_rating"] = int(rating_match.group(1))
        
        # Save processed feedback
        self._save_processed_feedback(feedback)
        
        # Update pending status
        if self.pending_file.exists():
            with open(self.pending_file, 'r') as f:
                pending = json.load(f)
            
            if task_name in pending:
                pending[task_name]["status"] = "feedback_received"
                pending[task_name]["feedback_timestamp"] = feedback["timestamp"]
                
                with open(self.pending_file, 'w') as f:
                    json.dump(pending, f, indent=2)
        
        return feedback
    
    def _save_processed_feedback(self, feedback: Dict):
        """Save processed feedback"""
        feedback_file = self.log_dir / "processed_feedback.json"
        
        feedbacks = []
        if feedback_file.exists():
            with open(feedback_file, 'r') as f:
                feedbacks = json.load(f)
        
        feedbacks.append(feedback)
        
        with open(feedback_file, 'w') as f:
            json.dump(feedbacks, f, indent=2)
    
    def get_pending_feedback_tasks(self) -> List[Dict]:
        """Get list of tasks awaiting feedback"""
        if not self.pending_file.exists():
            return []
        
        with open(self.pending_file, 'r') as f:
            pending = json.load(f)
        
        return [
            {"task_name": k, **v} 
            for k, v in pending.items() 
            if v["status"] == "awaiting_feedback"
        ]
    
    def generate_improvement_report(self) -> str:
        """Generate report from all collected feedback"""
        feedback_file = self.log_dir / "processed_feedback.json"
        
        if not feedback_file.exists():
            return "No feedback data available yet."
        
        with open(feedback_file, 'r') as f:
            feedbacks = json.load(f)
        
        # Aggregate insights
        all_improvements = []
        all_successes = []
        all_actions = []
        ratings = []
        
        for fb in feedbacks:
            all_improvements.extend(fb.get("what_needs_improvement", []))
            all_successes.extend(fb.get("what_worked", []))
            all_actions.extend(fb.get("action_items", []))
            if fb.get("satisfaction_rating"):
                ratings.append(fb["satisfaction_rating"])
        
        # Build report
        report = ["# Voice Feedback Analysis Report\n"]
        report.append(f"Generated: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M')}\n")
        
        if ratings:
            avg_rating = sum(ratings) / len(ratings)
            report.append(f"## Average Satisfaction: {avg_rating:.1f}/10\n")
        
        if all_successes:
            report.append("## What's Working Well")
            # Count frequency
            success_counts = {}
            for item in all_successes:
                success_counts[item] = success_counts.get(item, 0) + 1
            
            for item, count in sorted(success_counts.items(), key=lambda x: x[1], reverse=True)[:5]:
                report.append(f"- {item} (mentioned {count}x)")
            report.append("")
        
        if all_improvements:
            report.append("## Common Improvement Areas")
            improvement_counts = {}
            for item in all_improvements:
                improvement_counts[item] = improvement_counts.get(item, 0) + 1
            
            for item, count in sorted(improvement_counts.items(), key=lambda x: x[1], reverse=True)[:5]:
                report.append(f"- {item} (mentioned {count}x)")
            report.append("")
        
        if all_actions:
            report.append("## Recommended Actions")
            for i, action in enumerate(set(all_actions)[:10], 1):
                report.append(f"{i}. {action}")
        
        return "\n".join(report)


# Hook functions for automation
def on_task_complete(task_name: str, task_type: str, **details):
    """Hook to call when a task completes"""
    slack = SlackIntegration()
    
    # Determine if this task type should request voice feedback
    voice_feedback_types = ["analysis", "content_generation", "client_setup", "major_update"]
    request_feedback = task_type in voice_feedback_types
    
    slack.send_notification(
        task_type=task_type,
        task_name=task_name,
        status="completed",
        details=details,
        voice_feedback_requested=request_feedback
    )


def on_error(task_name: str, error_message: str, **details):
    """Hook to call when an error occurs"""
    slack = SlackIntegration()
    
    details["error_message"] = error_message
    slack.send_notification(
        task_type="error",
        task_name=task_name,
        status="error",
        details=details,
        voice_feedback_requested=False
    )


# CLI interface
if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Slack Integration for Claude Code")
    parser.add_argument("action", choices=["notify", "process-feedback", "pending", "report"])
    
    # For notify action
    parser.add_argument("--task", help="Task name")
    parser.add_argument("--type", help="Task type")
    parser.add_argument("--status", default="completed", help="Task status")
    parser.add_argument("--details", help="JSON string of details")
    
    # For process-feedback action
    parser.add_argument("--transcript", help="Voice feedback transcript")
    
    args = parser.parse_args()
    slack = SlackIntegration()
    
    if args.action == "notify":
        if not args.task or not args.type:
            print("Error: --task and --type required for notify")
            sys.exit(1)
        
        details = json.loads(args.details) if args.details else {}
        success = slack.send_notification(
            task_type=args.type,
            task_name=args.task,
            status=args.status,
            details=details
        )
        print(f"Notification sent: {success}")
    
    elif args.action == "process-feedback":
        if not args.task or not args.transcript:
            print("Error: --task and --transcript required")
            sys.exit(1)
        
        feedback = slack.process_voice_feedback(args.task, args.transcript)
        print(json.dumps(feedback, indent=2))
    
    elif args.action == "pending":
        pending = slack.get_pending_feedback_tasks()
        if pending:
            print("Tasks awaiting voice feedback:")
            for task in pending:
                print(f"- {task['task_name']} ({task['task_type']})")
        else:
            print("No tasks awaiting feedback")
    
    elif args.action == "report":
        report = slack.generate_improvement_report()
        print(report)