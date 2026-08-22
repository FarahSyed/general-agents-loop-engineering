# Project 4: Testing Guide — Fix Loop with Real Checker

## Quick Start

```bash
cd D:\giaic-marathon-projects\p4-fix-loop

# Install jest if not already done
npm install --save-dev jest

# Run the loop
bash fix-loop.sh
```

## What to Verify

### 1. Tests fail before the loop
```bash
npm test
# Should show: divide() test FAILING (returns 20 instead of 5)
```

### 2. Loop runs and fixes the bug
- Maker (opencode) reads the skill, fixes the code
- Checker (npm test) verifies it works

### 3. After the loop
```bash
# Tests pass
npm test

# Check the fix
cat src/calculator.js
# Should show: return a / b;  (not a * b)

# Check the spine
cat progress.md
# Should show the run log
```

## The Bug

| Function | Before | After |
|----------|--------|-------|
| `divide(10, 2)` | returns `20` (wrong) | returns `5` (correct) |

## Key Check

The fix must be `a / b`, not `a * b`. If you see `a * b` still, the loop didn't fix it.

## Commands

```bash
# Run the loop
bash fix-loop.sh

# Check tests manually
npm test

# Check the fix
cat src/calculator.js

# Check the spine
cat progress.md
```
