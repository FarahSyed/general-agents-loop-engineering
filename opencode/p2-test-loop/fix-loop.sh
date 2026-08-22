#!/usr/bin/env bash
# Project 2: Conditional loop (run-until-done)
# HEARTBEAT: shell for-loop with a cap of 6 tries
# CHECKER:   npm test (exit code decides "done" — not the model)
# SPINE:     progress.md (read at start, updated at end)
# LIMIT:     6 tries max
#
# KEY LESSON: A command (test runner) decides when work is complete.
#             The agent that writes the fix does NOT approve its own work.
#             This is the maker-checker split from Concept 11.

MAX_TRIES=6
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

echo "=== Project 2: Conditional Loop ==="
echo "Date: $DATE"
echo "Checker: npm test (real command, not the agent)"
echo "Cap: $MAX_TRIES tries"
echo ""

# ── SPINE: Read memory first (Concept 12) ──
echo "--- Reading spine (progress.md) ---"
if [ -f progress.md ]; then
  cat progress.md
else
  echo "No progress.md found — starting fresh."
fi
echo ""

# ── Log the start ──
echo "" >> progress.md
echo "## Run: $DATE $TIME" >> progress.md
echo "- **Goal:** Fix failing tests in src/math.js" >> progress.md
echo "- **Checker:** npm test (exit code)" >> progress.md
echo "- **Cap:** $MAX_TRIES tries" >> progress.md
echo "" >> progress.md

# ── The loop ──
for i in $(seq 1 $MAX_TRIES); do
  echo "--- Beat $i of $MAX_TRIES ---"

  # Maker: opencode tries to fix the tests
  opencode run "Read the failing tests in test/math.test.js, understand what they expect, and fix src/math.js to make them pass. Do NOT change the tests. Only fix the implementation in src/math.js."

  # Checker: a real command decides if we're done
  echo "[$(date +%T)] Running checker: npm test"
  if npm test 2>&1; then
    echo ""
    echo "=== CONDITION MET on try $i ==="

    # ── SPINE: Update memory last ──
    echo "- **Beat $i:** Tests PASS — loop stopped (CONDITION MET)" >> progress.md
    echo "- **Result:** SUCCESS" >> progress.md
    echo "- **Fix applied:** opencode corrected src/math.js" >> progress.md

    echo "All tests pass. Loop stopped because the WORK IS COMPLETE."
    echo "This is NOT the cap — the checker proved the work is done."
    echo ""
    echo "--- Final spine (progress.md) ---"
    cat progress.md
    exit 0
  else
    echo "[$(date +%T)] Tests still failing on try $i — continuing..."
    echo "- **Beat $i:** Tests FAIL — continuing" >> progress.md
    echo ""
  fi
done

# ── SPINE: Cap hit, log the failure ──
echo ""
echo "=== CAP HIT after $MAX_TRIES tries ==="
echo "- **Result:** FAILED — hit cap with $MAX_TRIES tries" >> progress.md
echo "- **Action needed:** Review prompt or increase cap" >> progress.md

echo "Tests still failing. The loop stopped because of the LIMIT, not success."
echo "Check progress.md for what was attempted."
echo ""
echo "--- Final spine (progress.md) ---"
cat progress.md
exit 1
