#!/bin/bash
# Paper Watch Loop - runs daily at a specified time
# Usage: ./paper-watch-loop.sh [hour] [topic]
# Example: ./paper-watch-loop.sh 9 "LLM agents"

HOUR=${1:-9}
TOPIC=${2:-"LLM agents"}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/paper-watch.log"

echo "📄  Starting Paper Watch scheduler"
echo "   Runs daily at ${HOUR}:00"
echo "   Topic: ${TOPIC}"
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
    echo "=== Paper Watch run: $(date) ===" >> "$LOG_FILE"
    cd "$SCRIPT_DIR" && PYTHONIOENCODING=utf-8 python3 paperwatch.py --topic "$TOPIC" 2>&1 | tee -a "$LOG_FILE"
    
    echo ""
    echo "[$(date)] Watch complete. Next run tomorrow at ${HOUR}:00"
done
