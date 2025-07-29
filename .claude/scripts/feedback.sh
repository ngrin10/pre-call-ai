#!/bin/bash
# Easy wrapper for feedback system

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FEEDBACK_PY="$SCRIPT_DIR/feedback_system.py"

# Function to display usage
usage() {
    echo "Usage: feedback [action] [options]"
    echo ""
    echo "Actions:"
    echo "  quick              Interactive quick feedback capture"
    echo "  analyze            Show feedback analysis and trends"
    echo "  pending            Show pending improvement items"
    echo ""
    echo "Example:"
    echo "  feedback quick"
    echo "  feedback analyze"
}

# Quick interactive feedback capture
quick_feedback() {
    echo "=== Claude Code Feedback Capture ==="
    echo ""
    
    # Get task name
    read -p "Task name: " task_name
    
    # Get time taken
    read -p "Time taken (minutes): " time_taken
    
    # Get errors
    read -p "Errors encountered (default 0): " errors
    errors=${errors:-0}
    
    # Get satisfaction rating
    while true; do
        read -p "Satisfaction rating (1-10): " rating
        if [[ "$rating" =~ ^[0-9]$|^10$ ]]; then
            break
        else
            echo "Please enter a number between 1 and 10"
        fi
    done
    
    # Get what worked well
    echo ""
    echo "What worked well? (Enter items one per line, empty line to finish)"
    worked=()
    while IFS= read -r line; do
        [[ -z "$line" ]] && break
        worked+=("$line")
    done
    
    # Get what needs improvement
    echo ""
    echo "What needs improvement? (Enter items one per line, empty line to finish)"
    improvements=()
    while IFS= read -r line; do
        [[ -z "$line" ]] && break
        improvements+=("$line")
    done
    
    # Get action items
    echo ""
    echo "Action items? (Enter items one per line, empty line to finish)"
    actions=()
    while IFS= read -r line; do
        [[ -z "$line" ]] && break
        actions+=("$line")
    done
    
    # Build command
    cmd="python3 \"$FEEDBACK_PY\" capture --task \"$task_name\" --time $time_taken --errors $errors --rating $rating"
    
    # Add worked items
    if [ ${#worked[@]} -gt 0 ]; then
        cmd="$cmd --worked"
        for item in "${worked[@]}"; do
            cmd="$cmd \"$item\""
        done
    fi
    
    # Add improvement items
    if [ ${#improvements[@]} -gt 0 ]; then
        cmd="$cmd --improve"
        for item in "${improvements[@]}"; do
            cmd="$cmd \"$item\""
        done
    fi
    
    # Add action items
    if [ ${#actions[@]} -gt 0 ]; then
        cmd="$cmd --actions"
        for item in "${actions[@]}"; do
            cmd="$cmd \"$item\""
        done
    fi
    
    # Execute command
    echo ""
    echo "Capturing feedback..."
    eval $cmd
    
    echo ""
    echo "Feedback captured successfully!"
}

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is required but not found"
    exit 1
fi

# Parse command
case "$1" in
    quick)
        quick_feedback
        ;;
    
    analyze)
        python3 "$FEEDBACK_PY" analyze
        ;;
    
    pending)
        python3 "$FEEDBACK_PY" pending
        ;;
    
    *)
        usage
        exit 1
        ;;
esac