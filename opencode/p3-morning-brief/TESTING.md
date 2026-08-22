# Project 3: Testing Guide — Morning Brief with Memory

## Quick Start

```bash
cd D:\giaic-marathon-projects\p3-morning-brief

# Run 1
bash morning-brief.sh

# Run 2 (should build on Run 1)
bash morning-brief.sh
```

## What to Verify

### After Run 1:
- `progress.md` shows "TODO comments found: X"
- Lists each TODO with file:line

### After Run 2:
- `progress.md` has TWO run entries
- Run 2 does NOT repeat Run 1's TODOs
- Run 2 might find NEW TODOs or show "no new changes"

### The Test:
```bash
# Check progress.md has two distinct runs
cat progress.md
```

If Run 2 repeats Run 1 exactly → **spine is broken**.

## Common Issues

### "No progress.md found"
The script creates it automatically on first run.

### Second run repeats the first
The spine isn't being read properly. Check that `cat progress.md` works at the start of the script.
