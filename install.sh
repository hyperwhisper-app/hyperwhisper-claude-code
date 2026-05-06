#!/bin/bash
set -e

claude plugin marketplace add hyperwhisper-app/hyperwhisper-claude-code
claude plugin install hyperwhisper@hyperwhisper

echo "HyperWhisper plugin installed. Restart Claude Code to activate."

open "hyperwhisper://agent-installed?agent=claude-code"

