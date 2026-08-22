# Project 3: Morning Brief with Memory

> A scheduled loop whose second run clearly builds on its first.

## What You Learn

- **Concept 6:** Unattended schedule (run twice to prove it)
- **Concept 12:** The spine (memory between runs)

## The Idea

A loop that runs once, reads `progress.md`, scans the repo for TODO comments, writes a summary, and updates `progress.md`. The key test: run it twice. The second run must NOT repeat what the first already recorded.

## Files

| File | Purpose |
|------|---------|
| `src/app.js` | Sample code with TODO comments |
| `src/utils.js` | More code with TODO comments |
| `morning-brief.sh` | The loop script |
| `progress.md` | The spine — memory between runs |

## Setup

```bash
cd D:\giaic-marathon-projects\p3-morning-brief
```

## Run

```bash
# First run
bash morning-brief.sh

# Second run — should NOT repeat the first
bash morning-brief.sh
```

## What "Done" Looks Like

- ✅ First run finds TODOs and writes them to `progress.md`
- ✅ Second run reads what the first found
- ✅ Second run does NOT repeat already-recorded TODOs
- ✅ `progress.md` shows both runs with different data

## Key Lesson

If the second run starts from nothing → **spine is broken**. The loop has no memory.
