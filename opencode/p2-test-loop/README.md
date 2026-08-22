# Project 2: Make Tests Pass, Then Stop

> A conditional loop where a **command** (test runner) decides "done", not the agent.

## What You Learn

- **Concept 5:** Conditional loop (run-until-done)
- **Concept 11:** Maker-checker split
- **Concept 12:** The spine (progress.md)
- **Concept 13:** Limits (cap at 6 tries)

## The Idea

You give the agent a job: "fix the failing tests." But the agent doesn't decide when it's done. A **real command** (`npm test`) decides. If the tests pass, the loop stops. If not, it tries again — up to 6 times.

This is the **maker-checker split**: opencode writes the fix, jest grades it.

## Files

| File | Purpose |
|------|---------|
| `src/math.js` | Buggy module (3 wrong implementations) |
| `test/math.test.js` | 3 failing tests |
| `fix-loop.sh` | The conditional loop script |
| `progress.md` | The spine — tracks what was tried |
| `TESTING.md` | Detailed testing guide |

## Setup

```bash
cd D:\giaic-marathon-projects\p2-test-loop
npm install
```

## Run

```bash
bash fix-loop.sh
```

## What Happens

```
=== Project 2: Conditional Loop ===
Date: 2026-08-21
Checker: npm test (real command, not the agent)
Cap: 6 tries

--- Reading spine (progress.md) ---
...

--- Beat 1 of 6 ---
[opencode reads tests, fixes src/math.js]

[$(date +%T)] Running checker: npm test
PASS test/math.test.js

=== CONDITION MET on try 1 ===
All tests pass. Loop stopped because the WORK IS COMPLETE.
This is NOT the cap — the checker proved the work is done.
```

## Key Components

### Heartbeat
- **Type:** Shell `for` loop
- **Cap:** 6 tries maximum

### Beat (one iteration)
1. `opencode run` — reads failing tests, tries to fix `src/math.js`
2. `npm test` — real command checks if tests pass
3. Exit code decides: `0` = done, non-zero = continue

### Checker
- **Tool:** jest (real test runner)
- **Why:** A command cannot convince itself the work is fine — this is proof, not a claim

### Spine
- `progress.md` — read at start, updated at end
- Tracks what was tried each beat

## The Bugs

| Function | What it does (wrong) | What it should do |
|----------|---------------------|-------------------|
| `add(2,3)` | returns `-1` (subtraction) | returns `5` (addition) |
| `multiply(4,5)` | returns `9` (addition) | returns `20` (multiplication) |
| `divide(10,2)` | returns `20` (multiplication) | returns `5` (division) |

## Verification

```bash
# Run the loop
bash fix-loop.sh

# Check what stopped the loop
# Look for "CONDITION MET" = success
# Look for "CAP HIT" = hit the limit

# Verify the fix
npm test

# See what opencode changed
cat src/math.js

# See the spine
cat progress.md
```

## Common Issues

### "test is not defined"
You ran `node test/math.test.js` — wrong! Use `npm test` instead.

### Tests still failing after fix
opencode may have changed the tests instead of the implementation. The prompt says "Do NOT change the tests."

### Loop hits the cap
The prompt or stopping condition needs work. Review `progress.md` to see what was attempted.

## What "Done" Looks Like

- ✅ Loop stops with "CONDITION MET" (tests pass)
- ✅ NOT "CAP HIT" (hit the limit)
- ✅ `src/math.js` has correct implementations
- ✅ `progress.md` shows what was tried each beat
- ✅ All 3 tests pass with `npm test`

## Next Step

Once this project works, move to **Project 3: Morning Brief with Memory** — a scheduled loop that builds on its own memory between runs.
