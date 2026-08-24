#!/bin/bash
# ISS Loop - runs every minute while open
# Usage: ./iss-loop.sh [interval_seconds]

INTERVAL=${1:-60}
COUNT=0

echo "🛰  Starting ISS tracker (every ${INTERVAL}s)"
echo "   Press Ctrl+C to stop"
echo ""

while true; do
    COUNT=$((COUNT + 1))
    echo "=== Beat #${COUNT} ==="
    PYTHONIOENCODING=utf-8 python3 ".claude/skills/iss-position/scripts/iss.py"
    echo ""
    sleep "$INTERVAL"
done
