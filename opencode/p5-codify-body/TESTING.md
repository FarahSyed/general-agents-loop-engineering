# Project 5: Testing Guide — Codify the Body

## Quick Start

```bash
cd D:\giaic-marathon-projects\p5-codify-body

# Run 1
bash fix-all.sh

# Run 2 (should fix the same bugs again — no memory)
bash fix-all.sh
```

## What to Verify

### After Run 1:
- All 3 candidates fixed
- Each gets PASS or FAIL
- Results saved in `results/` directory

### After Run 2:
- Same bugs fixed again (proves no memory)
- Same results as Run 1

### The Test:
```bash
# Check results
cat results/summary.txt

# Should show:
# math.js: PASS
# string.js: PASS
# array.js: PASS
```

## The Key Question

After running twice, answer:
- **What would it need to become a loop?**
  - Answer: A heartbeat (schedule) + a progress file (spine)

## Commands

```bash
# Run the script
bash fix-all.sh

# Check results
cat results/summary.txt

# See what was fixed
cat results/math-maker.log
cat results/math-reviewer.log
```
