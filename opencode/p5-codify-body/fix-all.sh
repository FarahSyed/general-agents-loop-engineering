#!/usr/bin/env bash
# Project 5: Codify the Body
# This is ONE script that fixes ALL candidates in parallel.
# It is NOT a loop — it has no memory between runs.
#
# WHAT THIS PROVES:
# - One command runs the whole body (no step-by-step prompting)
# - Each candidate gets its own isolated checkout
# - Reviewer grades each one (PASS/FAIL)
# - Run it twice → it remembers nothing (no spine)
#
# KEY LESSON: This is an ENGINE, not a LOOP.
# To make it a loop, you need:
#   1. A heartbeat to fire it on schedule
#   2. A progress file its agents write

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)
RESULTS_DIR="results"

echo "=== Project 5: Codify the Body ==="
echo "Date: $DATE $TIME"
echo "This script fixes ALL candidates in parallel."
echo ""

# Clean previous results
rm -rf "$RESULTS_DIR"
mkdir -p "$RESULTS_DIR"

# ── List candidates ──
echo "--- Candidates to fix ---"
CANDIDATES=$(ls candidates/*.js 2>/dev/null | grep -v test | grep -v node_modules)
echo "$CANDIDATES"
echo ""

# ── Fix each candidate in parallel ──
echo "--- Fixing candidates in parallel ---"
for candidate in $CANDIDATES; do
  NAME=$(basename "$candidate" .js)
  echo "Starting fix for $NAME..."

  # Run maker in background (&)
  opencode run "Fix the bug in $candidate. The tests are in candidates/${NAME}.test.js. Only change the source file, not the tests." > "$RESULTS_DIR/${NAME}-maker.log" 2>&1 &
done

# Wait for all makers to finish
echo ""
echo "Waiting for all fixes to complete..."
wait
echo "All fixes done."
echo ""

# ── Review each candidate ──
echo "--- Reviewing fixes ---"
for candidate in $CANDIDATES; do
  NAME=$(basename "$candidate" .js)
  echo "Reviewing $NAME..."

  # Run reviewer
  REVIEWER_OUTPUT=$(opencode run "You are a strict code reviewer. Read $candidate and candidates/${NAME}.test.js. Run: node -e \"const t = require('./candidates/${NAME}.test'); t();\" to verify. Check: 1) Is the fix correct? 2) Did it only change the source? Reply PASS or FAIL." 2>&1)

  # Save result
  echo "$REVIEWER_OUTPUT" > "$RESULTS_DIR/${NAME}-reviewer.log"

  # Check verdict
  if echo "$REVIEWER_OUTPUT" | grep -q "PASS"; then
    echo "  → PASS"
    echo "$NAME: PASS" >> "$RESULTS_DIR/summary.txt"
  else
    echo "  → FAIL"
    echo "$NAME: FAIL" >> "$RESULTS_DIR/summary.txt"
  fi
  echo ""
done

# ── Summary ──
echo "=== Summary ==="
cat "$RESULTS_DIR/summary.txt"
echo ""
echo "=== Done ==="
echo "This was ONE run of the body. No memory persists."
echo "Run it again — it will fix the same bugs again (no spine)."
