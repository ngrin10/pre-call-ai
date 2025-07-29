#!/usr/bin/env python3
"""
Feedback Loop System for Claude Code
Captures, analyzes, and tracks improvement feedback
"""

import json
import datetime
from pathlib import Path
from typing import Dict, List
import statistics

class FeedbackSystem:
    def __init__(self, log_dir: str = ".claude/logs"):
        self.log_dir = Path(log_dir)
        self.log_dir.mkdir(parents=True, exist_ok=True)
        self.feedback_file = self.log_dir / "feedback.md"
        self.metrics_file = self.log_dir / "feedback_metrics.json"
        self.improvements_file = self.log_dir / "improvements.md"
        
    def capture_feedback(self,
                        task_name: str,
                        time_taken: int,
                        errors_encountered: int,
                        satisfaction_rating: int,
                        what_worked: List[str],
                        what_needs_improvement: List[str],
                        action_items: List[str]):
        """Capture feedback for a session"""
        
        timestamp = datetime.datetime.now()
        
        # Append to feedback markdown
        with open(self.feedback_file, 'a') as f:
            f.write(f"\n## Session: [{timestamp.strftime('%Y-%m-%d %H:%M')}] - {task_name}\n\n")
            
            f.write("### What Worked Well\n")
            for item in what_worked:
                f.write(f"- {item}\n")
            
            f.write("\n### What Needs Improvement\n")
            for item in what_needs_improvement:
                f.write(f"- {item}\n")
            
            f.write("\n### Action Items\n")
            for item in action_items:
                f.write(f"- {item}\n")
            
            f.write(f"\n### Metrics\n")
            f.write(f"- Time taken: {time_taken} minutes\n")
            f.write(f"- Errors encountered: {errors_encountered}\n")
            f.write(f"- User satisfaction: {satisfaction_rating}/10\n")
            f.write("\n---\n")
        
        # Update metrics
        self._update_metrics({
            "timestamp": timestamp.isoformat(),
            "task_name": task_name,
            "time_taken": time_taken,
            "errors_encountered": errors_encountered,
            "satisfaction_rating": satisfaction_rating,
            "improvement_count": len(what_needs_improvement),
            "success_count": len(what_worked)
        })
        
        # Process improvements
        self._process_improvements(what_needs_improvement, action_items)
        
        return {
            "status": "Feedback captured successfully",
            "metrics_updated": True,
            "improvements_logged": len(action_items)
        }
    
    def _update_metrics(self, session_metrics: Dict):
        """Update aggregated metrics"""
        metrics = {"sessions": []}
        
        if self.metrics_file.exists():
            with open(self.metrics_file, 'r') as f:
                metrics = json.load(f)
        
        metrics["sessions"].append(session_metrics)
        
        # Calculate aggregates
        if len(metrics["sessions"]) > 0:
            times = [s["time_taken"] for s in metrics["sessions"]]
            errors = [s["errors_encountered"] for s in metrics["sessions"]]
            ratings = [s["satisfaction_rating"] for s in metrics["sessions"]]
            
            metrics["aggregates"] = {
                "total_sessions": len(metrics["sessions"]),
                "avg_time": round(statistics.mean(times), 2),
                "avg_errors": round(statistics.mean(errors), 2),
                "avg_satisfaction": round(statistics.mean(ratings), 2),
                "time_trend": self._calculate_trend(times),
                "error_trend": self._calculate_trend(errors),
                "satisfaction_trend": self._calculate_trend(ratings)
            }
        
        with open(self.metrics_file, 'w') as f:
            json.dump(metrics, f, indent=2)
    
    def _calculate_trend(self, values: List[float]) -> str:
        """Calculate trend direction"""
        if len(values) < 2:
            return "insufficient_data"
        
        recent = values[-5:]  # Last 5 sessions
        if len(recent) < 2:
            return "insufficient_data"
        
        # Simple linear trend
        avg_first_half = statistics.mean(recent[:len(recent)//2])
        avg_second_half = statistics.mean(recent[len(recent)//2:])
        
        if avg_second_half > avg_first_half * 1.1:
            return "improving"
        elif avg_second_half < avg_first_half * 0.9:
            return "declining"
        else:
            return "stable"
    
    def _process_improvements(self, issues: List[str], actions: List[str]):
        """Track improvement items over time"""
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d')
        
        with open(self.improvements_file, 'a') as f:
            f.write(f"\n## [{timestamp}] Improvement Items\n\n")
            
            if issues:
                f.write("### Issues Identified\n")
                for issue in issues:
                    f.write(f"- {issue}\n")
            
            if actions:
                f.write("\n### Action Items\n")
                for action in actions:
                    f.write(f"- [ ] {action}\n")
            
            f.write("\n")
    
    def analyze_feedback(self) -> Dict:
        """Analyze all feedback and provide insights"""
        if not self.metrics_file.exists():
            return {"error": "No feedback data available"}
        
        with open(self.metrics_file, 'r') as f:
            metrics = json.load(f)
        
        if "aggregates" not in metrics:
            return {"error": "Insufficient data for analysis"}
        
        agg = metrics["aggregates"]
        insights = []
        
        # Time analysis
        if agg["time_trend"] == "improving":
            insights.append("✅ Task completion time is improving")
        elif agg["time_trend"] == "declining":
            insights.append("⚠️ Task completion time is increasing")
        
        # Error analysis
        if agg["avg_errors"] < 1:
            insights.append("✅ Low error rate maintained")
        elif agg["error_trend"] == "declining":
            insights.append("⚠️ Error rate is increasing")
        
        # Satisfaction analysis
        if agg["avg_satisfaction"] >= 8:
            insights.append("✅ High user satisfaction")
        elif agg["avg_satisfaction"] < 6:
            insights.append("⚠️ User satisfaction needs improvement")
        
        return {
            "summary": agg,
            "insights": insights,
            "recommendation": self._get_recommendation(agg)
        }
    
    def _get_recommendation(self, aggregates: Dict) -> str:
        """Provide actionable recommendation based on metrics"""
        if aggregates["avg_satisfaction"] < 6:
            return "Focus on addressing user pain points and improving workflow efficiency"
        elif aggregates["avg_errors"] > 3:
            return "Implement better validation and error prevention mechanisms"
        elif aggregates["time_trend"] == "declining":
            return "Investigate causes of increased task completion time"
        else:
            return "Continue current practices while seeking incremental improvements"
    
    def get_pending_improvements(self) -> List[str]:
        """Get list of pending improvement items"""
        if not self.improvements_file.exists():
            return []
        
        pending = []
        with open(self.improvements_file, 'r') as f:
            for line in f:
                if line.startswith("- [ ]"):
                    pending.append(line.strip()[6:])  # Remove "- [ ] "
        
        return pending


# CLI interface
if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Claude Code Feedback System")
    parser.add_argument("action", choices=["capture", "analyze", "pending"])
    
    # For capture action
    parser.add_argument("--task", help="Task name")
    parser.add_argument("--time", type=int, help="Time taken in minutes")
    parser.add_argument("--errors", type=int, default=0, help="Number of errors")
    parser.add_argument("--rating", type=int, help="Satisfaction rating (1-10)")
    parser.add_argument("--worked", nargs="+", help="What worked well")
    parser.add_argument("--improve", nargs="+", help="What needs improvement")
    parser.add_argument("--actions", nargs="+", help="Action items")
    
    args = parser.parse_args()
    feedback = FeedbackSystem()
    
    if args.action == "capture":
        if not all([args.task, args.time, args.rating]):
            print("Error: --task, --time, and --rating are required for capture")
            exit(1)
        
        result = feedback.capture_feedback(
            task_name=args.task,
            time_taken=args.time,
            errors_encountered=args.errors or 0,
            satisfaction_rating=args.rating,
            what_worked=args.worked or [],
            what_needs_improvement=args.improve or [],
            action_items=args.actions or []
        )
        print(json.dumps(result, indent=2))
    
    elif args.action == "analyze":
        analysis = feedback.analyze_feedback()
        print(json.dumps(analysis, indent=2))
    
    elif args.action == "pending":
        pending = feedback.get_pending_improvements()
        if pending:
            print("Pending Improvements:")
            for item in pending:
                print(f"- {item}")
        else:
            print("No pending improvements")