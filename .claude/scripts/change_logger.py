#!/usr/bin/env python3
"""
Change Logger for Claude Code
Tracks all file modifications with detailed context
"""

import json
import datetime
from pathlib import Path
from typing import Dict, List, Optional

class ChangeLogger:
    def __init__(self, log_dir: str = ".claude/logs"):
        self.log_dir = Path(log_dir)
        self.log_dir.mkdir(parents=True, exist_ok=True)
        self.changes_file = self.log_dir / "changes.json"
        self.daily_log = self.log_dir / f"changes_{datetime.date.today()}.md"
        
    def log_change(self, 
                   file_path: str,
                   change_type: str,  # CREATE, EDIT, DELETE
                   task_id: str,
                   reason: str,
                   changes_description: str,
                   before_snippet: Optional[str] = None,
                   after_snippet: Optional[str] = None):
        """Log a single change to both JSON and markdown formats"""
        
        timestamp = datetime.datetime.now().isoformat()
        
        # Create change entry
        change_entry = {
            "timestamp": timestamp,
            "file_path": file_path,
            "change_type": change_type,
            "task_id": task_id,
            "reason": reason,
            "changes_description": changes_description,
            "before_snippet": before_snippet,
            "after_snippet": after_snippet
        }
        
        # Append to JSON log
        self._append_json_log(change_entry)
        
        # Append to daily markdown log
        self._append_markdown_log(change_entry)
        
        return change_entry
    
    def _append_json_log(self, entry: Dict):
        """Append entry to JSON log file"""
        changes = []
        if self.changes_file.exists():
            with open(self.changes_file, 'r') as f:
                changes = json.load(f)
        
        changes.append(entry)
        
        with open(self.changes_file, 'w') as f:
            json.dump(changes, f, indent=2)
    
    def _append_markdown_log(self, entry: Dict):
        """Append entry to daily markdown log"""
        with open(self.daily_log, 'a') as f:
            f.write(f"\n## [{entry['timestamp']}] {entry['change_type']}: {entry['file_path']}\n")
            f.write(f"**Task**: {entry['task_id']}\n")
            f.write(f"**Reason**: {entry['reason']}\n")
            f.write(f"**Changes**: {entry['changes_description']}\n")
            
            if entry['before_snippet']:
                f.write(f"\n### Before:\n```\n{entry['before_snippet']}\n```\n")
            
            if entry['after_snippet']:
                f.write(f"\n### After:\n```\n{entry['after_snippet']}\n```\n")
            
            f.write("\n---\n")
    
    def get_changes_by_task(self, task_id: str) -> List[Dict]:
        """Get all changes related to a specific task"""
        if not self.changes_file.exists():
            return []
        
        with open(self.changes_file, 'r') as f:
            all_changes = json.load(f)
        
        return [c for c in all_changes if c['task_id'] == task_id]
    
    def get_changes_by_file(self, file_path: str) -> List[Dict]:
        """Get all changes made to a specific file"""
        if not self.changes_file.exists():
            return []
        
        with open(self.changes_file, 'r') as f:
            all_changes = json.load(f)
        
        return [c for c in all_changes if c['file_path'] == file_path]
    
    def generate_summary(self, task_id: Optional[str] = None) -> str:
        """Generate a summary of changes"""
        if not self.changes_file.exists():
            return "No changes logged yet."
        
        with open(self.changes_file, 'r') as f:
            all_changes = json.load(f)
        
        if task_id:
            changes = [c for c in all_changes if c['task_id'] == task_id]
            summary = f"# Change Summary for Task: {task_id}\n\n"
        else:
            changes = all_changes
            summary = "# Overall Change Summary\n\n"
        
        summary += f"Total changes: {len(changes)}\n\n"
        
        # Group by file
        files_modified = {}
        for change in changes:
            file_path = change['file_path']
            if file_path not in files_modified:
                files_modified[file_path] = []
            files_modified[file_path].append(change)
        
        summary += f"Files modified: {len(files_modified)}\n\n"
        
        for file_path, file_changes in files_modified.items():
            summary += f"\n## {file_path}\n"
            for change in file_changes:
                summary += f"- [{change['timestamp']}] {change['change_type']}: {change['reason']}\n"
        
        return summary


# CLI interface
if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Claude Code Change Logger")
    parser.add_argument("action", choices=["log", "summary", "by-task", "by-file"])
    parser.add_argument("--file", help="File path")
    parser.add_argument("--type", choices=["CREATE", "EDIT", "DELETE"], help="Change type")
    parser.add_argument("--task", help="Task ID")
    parser.add_argument("--reason", help="Reason for change")
    parser.add_argument("--description", help="Description of changes")
    parser.add_argument("--before", help="Before snippet")
    parser.add_argument("--after", help="After snippet")
    
    args = parser.parse_args()
    logger = ChangeLogger()
    
    if args.action == "log":
        if not all([args.file, args.type, args.task, args.reason, args.description]):
            print("Error: For logging, --file, --type, --task, --reason, and --description are required")
            exit(1)
        
        logger.log_change(
            file_path=args.file,
            change_type=args.type,
            task_id=args.task,
            reason=args.reason,
            changes_description=args.description,
            before_snippet=args.before,
            after_snippet=args.after
        )
        print(f"Change logged for {args.file}")
    
    elif args.action == "summary":
        print(logger.generate_summary(args.task))
    
    elif args.action == "by-task":
        if not args.task:
            print("Error: --task is required for by-task action")
            exit(1)
        changes = logger.get_changes_by_task(args.task)
        print(json.dumps(changes, indent=2))
    
    elif args.action == "by-file":
        if not args.file:
            print("Error: --file is required for by-file action")
            exit(1)
        changes = logger.get_changes_by_file(args.file)
        print(json.dumps(changes, indent=2))