#!/bin/bash
# Easy wrapper for change logging

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOGGER="$SCRIPT_DIR/change_logger.py"

# Function to display usage
usage() {
    echo "Usage: log-change [action] [options]"
    echo ""
    echo "Actions:"
    echo "  create <file> <task> <reason>    Log file creation"
    echo "  edit <file> <task> <reason>      Log file edit"
    echo "  delete <file> <task> <reason>    Log file deletion"
    echo "  summary [task]                   Show change summary"
    echo "  task <task-id>                   Show changes for task"
    echo "  file <file-path>                 Show changes for file"
    echo ""
    echo "Examples:"
    echo "  log-change create src/auth.js auth-system 'Added authentication module'"
    echo "  log-change edit src/auth.js auth-system 'Fixed JWT validation'"
    echo "  log-change summary auth-system"
}

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is required but not found"
    exit 1
fi

# Parse command
case "$1" in
    create)
        if [ $# -lt 4 ]; then
            echo "Error: Not enough arguments for create"
            usage
            exit 1
        fi
        python3 "$LOGGER" log \
            --file "$2" \
            --type CREATE \
            --task "$3" \
            --reason "$4" \
            --description "Created new file: $2"
        ;;
    
    edit)
        if [ $# -lt 4 ]; then
            echo "Error: Not enough arguments for edit"
            usage
            exit 1
        fi
        python3 "$LOGGER" log \
            --file "$2" \
            --type EDIT \
            --task "$3" \
            --reason "$4" \
            --description "Modified file: $2"
        ;;
    
    delete)
        if [ $# -lt 4 ]; then
            echo "Error: Not enough arguments for delete"
            usage
            exit 1
        fi
        python3 "$LOGGER" log \
            --file "$2" \
            --type DELETE \
            --task "$3" \
            --reason "$4" \
            --description "Deleted file: $2"
        ;;
    
    summary)
        if [ -n "$2" ]; then
            python3 "$LOGGER" summary --task "$2"
        else
            python3 "$LOGGER" summary
        fi
        ;;
    
    task)
        if [ -z "$2" ]; then
            echo "Error: Task ID required"
            usage
            exit 1
        fi
        python3 "$LOGGER" by-task --task "$2"
        ;;
    
    file)
        if [ -z "$2" ]; then
            echo "Error: File path required"
            usage
            exit 1
        fi
        python3 "$LOGGER" by-file --file "$2"
        ;;
    
    *)
        usage
        exit 1
        ;;
esac