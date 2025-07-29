#!/usr/bin/env python3
"""
Post-Edit Hook for Claude Code
Validates files after editing with type checking and linting
"""

import sys
import json
import subprocess
from pathlib import Path

def main():
    # Get input data from Claude Code
    try:
        input_data = json.loads(sys.stdin.read())
    except:
        # If no input data, exit gracefully
        sys.exit(0)
    
    # Extract file information
    tool = input_data.get('tool', '')
    tool_input = input_data.get('tool_input', {})
    
    # Only process file edit operations
    if tool not in ['Edit', 'MultiEdit', 'Write']:
        sys.exit(0)
    
    # Get file path
    file_path = tool_input.get('file_path', '')
    if not file_path:
        sys.exit(0)
    
    file_path = Path(file_path)
    
    # Check file extension and run appropriate validation
    if file_path.suffix in ['.ts', '.tsx']:
        check_typescript(file_path)
    elif file_path.suffix in ['.js', '.jsx']:
        check_javascript(file_path)
    elif file_path.suffix == '.py':
        check_python(file_path)
    elif file_path.suffix == '.sh':
        check_shell(file_path)

def check_typescript(file_path):
    """Run TypeScript type checking"""
    try:
        # Try to find tsconfig.json
        current = file_path.parent
        tsconfig = None
        while current != current.parent:
            if (current / 'tsconfig.json').exists():
                tsconfig = current / 'tsconfig.json'
                break
            current = current.parent
        
        if tsconfig:
            # Run tsc with project config
            result = subprocess.run(
                ['npx', 'tsc', '--noEmit', '--project', str(tsconfig)],
                capture_output=True,
                text=True
            )
        else:
            # Run tsc on single file
            result = subprocess.run(
                ['npx', 'tsc', '--noEmit', str(file_path)],
                capture_output=True,
                text=True
            )
        
        if result.returncode != 0:
            print(f"TypeScript errors in {file_path}:", file=sys.stderr)
            print(result.stdout, file=sys.stderr)
            sys.exit(2)  # Exit code 2 for blocking error
    except FileNotFoundError:
        # TypeScript not installed, skip
        pass

def check_javascript(file_path):
    """Run ESLint on JavaScript files"""
    try:
        result = subprocess.run(
            ['npx', 'eslint', str(file_path)],
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            print(f"ESLint errors in {file_path}:", file=sys.stderr)
            print(result.stdout, file=sys.stderr)
            sys.exit(1)  # Exit code 1 for non-blocking warning
    except FileNotFoundError:
        # ESLint not installed, skip
        pass

def check_python(file_path):
    """Run Python linting and type checking"""
    # Try ruff first (fast Python linter)
    try:
        result = subprocess.run(
            ['ruff', 'check', str(file_path)],
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            print(f"Ruff errors in {file_path}:", file=sys.stderr)
            print(result.stdout, file=sys.stderr)
            sys.exit(1)  # Non-blocking warning
    except FileNotFoundError:
        # Try flake8 as fallback
        try:
            result = subprocess.run(
                ['flake8', str(file_path)],
                capture_output=True,
                text=True
            )
            
            if result.returncode != 0:
                print(f"Flake8 errors in {file_path}:", file=sys.stderr)
                print(result.stdout, file=sys.stderr)
                sys.exit(1)
        except FileNotFoundError:
            pass
    
    # Try mypy for type checking
    try:
        result = subprocess.run(
            ['mypy', str(file_path)],
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0 and "error:" in result.stdout:
            print(f"Type errors in {file_path}:", file=sys.stderr)
            print(result.stdout, file=sys.stderr)
            sys.exit(2)  # Blocking error for type issues
    except FileNotFoundError:
        pass

def check_shell(file_path):
    """Run shellcheck on shell scripts"""
    try:
        result = subprocess.run(
            ['shellcheck', str(file_path)],
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            print(f"ShellCheck errors in {file_path}:", file=sys.stderr)
            print(result.stdout, file=sys.stderr)
            sys.exit(1)  # Non-blocking warning
    except FileNotFoundError:
        # ShellCheck not installed, skip
        pass

if __name__ == "__main__":
    main()