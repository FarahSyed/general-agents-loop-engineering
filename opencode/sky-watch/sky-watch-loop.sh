#!/bin/bash
# Sky Watch Loop - runs daily at a specified time
# Usage: ./sky-watch-loop.sh [hour] [days]
# Example: ./sky-watch-loop.sh 8 1 (runs at 8am, shows today only)

HOUR=${1:-8}
DAYS=${2:-1}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/sky-watch.log"

echo "☄  Starting Sky Watch scheduler"
echo "   Runs daily at ${HOUR}:00"
echo "   Shows ${DAYS} day(s) ahead"
echo "   Log: $LOG_FILE"
echo ""

while true; do
    # Calculate seconds until next run
    NOW=$(date +%s)
    TARGET=$(date -d "today ${HOUR}:00" +%s 2>/dev/null || date -d "$(date +%Y-%m-%d) ${HOUR}:00" +%s)
    
    # If target time has passed today, schedule for tomorrow
    if [ "$TARGET" -le "$NOW" ]; then
        TARGET=$(date -d "tomorrow ${HOUR}:00" +%s 2>/dev/null || date -d "$(date -d 'tomorrow' +%Y-%m-%d) ${HOUR}:00" +%s)
    fi
    
    SLEEP_SECONDS=$((TARGET - NOW))
    echo "[$(date)] Next run in $((SLEEP_SECONDS / 3600)) hours $(( (SLEEP_SECONDS % 3600) / 60 )) minutes"
    sleep "$SLEEP_SECONDS"
    
    # Run the watch
    echo "" >> "$LOG_FILE"
    echo "=== Sky Watch run: $(date) ===" >> "$LOG_FILE"
    PYTHONIOENCODING=utf-8 python3 "$SCRIPT_DIR/.claude/skills/sky-watch/scripts/skywatch.py" --days "$DAYS" 2>&1 | tee -a "$LOG_FILE"
    
    echo ""
    echo "[$(date)] Watch complete. Next run tomorrow at ${HOUR}:00"
done
