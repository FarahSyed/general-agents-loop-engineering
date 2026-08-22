# Project 5: Codify the Body

> Turn Project 4's orchestration into ONE re-runnable script, then prove it is NOT a loop.

## What You Learn

- **Dynamic workflows:** One command runs the whole body
- **Isolation:** Each candidate gets its own checkout
- **The difference between an engine and a loop**

## The Idea

Take the fix loop from Project 4 and codify it. Instead of fixing one bug at a time, fix ALL bugs in parallel with one command.

## Files

| File | Purpose |
|------|---------|
| `candidates/math.js` | Bug: `add()` returns subtraction |
| `candidates/string.js` | Bug: `capitalize()` returns lowercase |
| `candidates/array.js` | Bug: `first()` returns wrong index |
| `candidates/*.test.js` | Tests for each candidate |
| `fix-all.sh` | The codified body — fixes all in parallel |
| `progress.md` | The spine (but NOT used by this script!) |

## Run

```bash
cd D:\giaic-marathon-projects\p5-codify-body

# Run 1
bash fix-all.sh

# Run 2 — proves it remembers nothing
bash fix-all.sh
```

## What "Done" Looks Like

- ✅ One script fixes all 3 candidates
- ✅ Each gets PASS or FAIL
- ✅ Run 2 fixes the same bugs again (no memory)
- ✅ You can name what it needs to become a loop: heartbeat + progress file

## Key Lesson

This is an **ENGINE**, not a **LOOP**.

To make it a loop, you need:
1. A **heartbeat** to fire it on schedule
2. A **progress file** its agents write

Without those, it's just a script that runs the same steps every time.
