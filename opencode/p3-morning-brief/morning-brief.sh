#!/usr/bin/env bash
# Project 3: Morning Brief with Memory
# HEARTBEAT: you run it twice manually (Concept 6: scheduled loop)
# SPINE:     progress.md (Concept 12: memory between runs)
# CHECKER:   you — verify the second run builds on the first
#
# KEY LESSON: The second run must NOT repeat what the first already recorded.
#             If it starts from nothing, the spine is broken.

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

echo "=== Project 3: Morning Brief ==="
echo "Date: $DATE $TIME"
echo ""

# ── SPINE: Read memory first (Concept 12) ──
echo "--- Reading spine (progress.md) ---"
if [ -f progress.md ]; then
  cat progress.md
else
  echo "No progress.md found — starting fresh."
fi
echo ""

# ── GATHER: Find TODO comments in the repo ──
echo "--- Scanning for TODO comments ---"
TODO_COUNT=$(grep -r "TODO" src/ --include="*.js" 2>/dev/null | wc -l)
echo "Found $TODO_COUNT TODO comments in src/"
echo ""

# ── COMPARE: Find NEW TODOs (not already in progress.md) ──
echo "--- Checking for NEW TODOs ---"
NEW_TODOS=0
while IFS= read -r line; do
  # Check if this TODO is already in progress.md
  if ! grep -qF "$line" progress.md 2>/dev/null; then
    echo "NEW: $line"
    NEW_TODOS=$((NEW_TODOS + 1))
  fi
done < <(grep -rn "TODO" src/ --include="*.js" 2>/dev/null)

echo ""
echo "New TODOs since last run: $NEW_TODOS"
echo ""

# ── SPINE: Update memory last ──
echo "--- Updating spine (progress.md) ---"
echo "" >> progress.md
echo "## Run: $DATE $TIME" >> progress.md
echo "- **Total TODOs found:** $TODO_COUNT" >> progress.md
echo "- **New since last run:** $NEW_TODOS" >> progress.md
echo "- **Files scanned:** src/" >> progress.md
echo "" >> progress.md

# List only NEW TODOs
if [ $NEW_TODOS -eq 0 ]; then
  echo "- No new TODOs — all already recorded." >> progress.md
else
  echo "- **New TODOs:**" >> progress.md
  while IFS= read -r line; do
    if ! grep -qF "$line" progress.md 2>/dev/null; then
      echo "  - $line" >> progress.md
    fi
  done < <(grep -rn "TODO" src/ --include="*.js" 2>/dev/null)
fi

echo ""
echo "=== Done ==="
echo "Spine updated. Run again to see if it builds on this."
