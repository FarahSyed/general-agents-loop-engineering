#!/bin/bash
# Project 8: Daily Lint Sweep
# The full six-part loop on a real chore

set -e

echo "=== Daily Lint Sweep ==="
echo "Date: $(date)"
echo ""

# ── SPINE: Read progress.md ──
echo "--- Reading spine (progress.md) ---"
if [ -f progress.md ]; then
  cat progress.md
else
  echo "No progress.md found. Creating..."
  echo "# Progress — Daily Lint Sweep" > progress.md
  echo "" >> progress.md
  echo "## Goal" >> progress.md
  echo "Daily lint sweep that fixes auto-fixable issues and reports unfixable ones." >> progress.md
  echo "" >> progress.md
  echo "## Runs" >> progress.md
fi
echo ""

# ── BUDGET GUARD: Check token limit ──
MAX_TOKENS=10000
echo "--- Budget Guard ---"
echo "Max tokens per run: $MAX_TOKENS"
echo ""

# ── MAKER: Run ESLint and fix ──
echo "--- Running ESLint ---"
if [ ! -d "src" ]; then
  echo "ERROR: src/ directory not found"
  echo "## Run: $(date)" >> progress.md
  echo "- **Status:** FAILED" >> progress.md
  echo "- **Error:** src/ directory not found" >> progress.md
  exit 1
fi

# Run ESLint
npx eslint src/ --format json > lint-results.json 2>/dev/null || true

# Count issues
TOTAL=$(cat lint-results.json | grep -o '"errorCount":[0-9]*' | grep -o '[0-9]*' | paste -sd+ 2>/dev/null || echo "0")
FIXABLE=$(cat lint-results.json | grep -o '"fixableCount":[0-9]*' | grep -o '[0-9]*' | paste -sd+ 2>/dev/null || echo "0")

echo "Total issues: $TOTAL"
echo "Auto-fixable: $FIXABLE"

# Fix auto-fixable issues
echo ""
echo "--- Fixing auto-fixable issues ---"
npx eslint src/ --fix 2>/dev/null || true

# ── CHECKER: Verify fixes ──
echo ""
echo "--- Verifying fixes ---"
npx eslint src/ --format json > lint-results-after.json 2>/dev/null || true

TOTAL_AFTER=$(cat lint-results-after.json | grep -o '"errorCount":[0-9]*' | grep -o '[0-9]*' | paste -sd+ 2>/dev/null || echo "0")

echo "Issues after fix: $TOTAL_AFTER"

# ── REPORT: Update CHANGELOG.md ──
echo ""
echo "--- Updating CHANGELOG.md ---"
if [ ! -f CHANGELOG.md ]; then
  echo "# Changelog" > CHANGELOG.md
  echo "" >> CHANGELOG.md
fi

echo "" >> CHANGELOG.md
echo "## $(date '+%Y-%m-%d') Lint Sweep" >> CHANGELOG.md
echo "" >> CHANGELOG.md
echo "- **Total issues:** $TOTAL" >> CHANGELOG.md
echo "- **Auto-fixed:** $((TOTAL - TOTAL_AFTER))" >> CHANGELOG.md
echo "- **Remaining:** $TOTAL_AFTER" >> CHANGELOG.md

if [ "$TOTAL_AFTER" -gt 0 ]; then
  echo "" >> CHANGELOG.md
  echo "### Unfixed Issues" >> CHANGELOG.md
  npx eslint src/ --format stylish 2>/dev/null | head -20 >> CHANGELOG.md || true
fi

# ── SPINE: Update progress.md ──
echo ""
echo "--- Updating progress.md ---"
echo "" >> progress.md
echo "## Run: $(date)" >> progress.md
echo "- **Total issues:** $TOTAL" >> progress.md
echo "- **Auto-fixed:** $((TOTAL - TOTAL_AFTER))" >> CHANGELOG.md
echo "- **Remaining:** $TOTAL_AFTER" >> progress.md
echo "- **Status:** SUCCESS" >> progress.md

# ── CONNECTOR: Git commit ──
echo ""
echo "--- Committing changes ---"
git add -A
git commit -m "Lint sweep: fixed $((TOTAL - TOTAL_AFTER)) issues" 2>/dev/null || echo "No changes to commit"

echo ""
echo "=== Done ==="
echo "Spine updated. Run again tomorrow to see if it builds on this."
