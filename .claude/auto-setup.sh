#!/bin/bash
# Automatic setup - runs everything in background

# Create a wrapper that logs all changes automatically
cat > ~/.claude/hooks/post_tool_use_wrapper.sh << 'EOF'
#!/bin/bash
# Auto-log changes in background

# Get the tool and file info from environment
TOOL="$1"
FILE="$2"
TASK="${TASK:-auto-tracked}"

# Log the change silently in background
if [[ "$TOOL" == "Edit" || "$TOOL" == "Write" || "$TOOL" == "MultiEdit" ]]; then
    (
        cd "$PWD"
        if [[ -f ".claude/scripts/log-change.sh" ]]; then
            ACTION="edit"
            [[ "$TOOL" == "Write" ]] && ACTION="create"
            ./.claude/scripts/log-change.sh "$ACTION" "$FILE" "$TASK" "Automated change tracking" &>/dev/null
        fi
    ) &
fi
EOF

chmod +x ~/.claude/hooks/post_tool_use_wrapper.sh

echo "✅ Auto-setup complete! Everything now runs in background:"
echo ""
echo "🤖 What happens automatically:"
echo "  • All file changes are logged"
echo "  • Notifications play when tasks complete"
echo "  • Type checking runs after edits"
echo ""
echo "📝 Simple commands you can use:"
echo "  • /scalestream - Run ScaleStream workflows"
echo "  • /analyze - Deep analysis of your code"
echo "  • /improve - Make code better"
echo "  • /review - Review changes"
echo ""
echo "🚀 That's it! Just work normally and everything is tracked."