#!/usr/bin/env bash
# Project 4: Fix Loop with Real Checker
# HEARTBEAT: shell loop with cap of 4 tries
# MAKER:     opencode run (uses the fix-bug skill)
# CHECKER:   opencode run (reviewer prompt, reads tests, grades PASS/FAIL)
# SPINE:     progress.md
# LIMIT:     4 tries
#
# KEY LESSON: The agent that writes the fix is NOT the agent that approves it.
#             A separate reviewer agent grades the work.

MAX_TRIES=4
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

echo "=== Project 4: Fix Loop with Real Checker ==="
echo "Date: $DATE"
echo "Maker: opencode (uses fix-bug skill)"
echo "Checker: opencode (reviewer prompt)"
echo "Cap: $MAX_TRIES tries"
echo ""

# ── SPINE: Read memory first ──
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
echo "- **Bug:** divide() returns wrong result" >> progress.md
echo "- **Cap:** $MAX_TRIES tries" >> progress.md
echo "" >> progress.md

# ── The loop ──
for i in $(seq 1 $MAX_TRIES); do
  echo "--- Beat $i of $MAX_TRIES ---"

  # Maker: opencode runs the fix-bug skill
  echo "[Maker] Running fix-bug skill..."
  opencode run "Use the fix-bug skill to fix the failing test in src/calculator.test.js. Read the skill instructions first. Only change src/calculator.js."

  # Checker: opencode reviews the fix
  echo ""
  echo "[Checker] Reviewing the fix..."
  REVIEWER_OUTPUT=$(opencode run "You are a strict code reviewer. Read src/calculator.js and src/calculator.test.js. Run npm test. Check: 1) Does divide return a / b? 2) Is the divide-by-zero check still there? 3) Did it change only the implementation? Reply PASS or FAIL with reasons." 2>&1)

  echo "$REVIEWER_OUTPUT"
  echo ""

  # Check if reviewer said PASS
  if echo "$REVIEWER_OUTPUT" | grep -q "PASS"; then
    echo "=== REVIEWER PASS on try $i ==="
    echo "- **Beat $i:** Reviewer says PASS" >> progress.md
    echo ""
    echo "The reviewer approved the fix."
    echo ""
    echo "=== Done ==="
    cat progress.md
    exit 0
  else
    echo "Reviewer said FAIL on try $i — continuing..."
    echo "- **Beat $i:** Reviewer says FAIL" >> progress.md
    echo ""
  fi
done

echo ""
echo "=== CAP HIT after $MAX_TRIES tries ==="
echo "- **Result:** FAILED — hit cap" >> progress.md
echo ""
cat progress.md
exit 1
