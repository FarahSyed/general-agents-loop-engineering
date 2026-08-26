#!/bin/bash
# Sky Watch - run once
# Usage: ./sky-watch.sh [days]
# Example: ./sky-watch.sh 7 (shows next 7 days)

DAYS=${1:-7}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "☄  Sky Watch — next ${DAYS} day(s)"
echo ""
PYTHONIOENCODING=utf-8 python3 "$SCRIPT_DIR/.claude/skills/sky-watch/scripts/skywatch.py" --days "$DAYS"
