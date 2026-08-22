# Project 2: Testing Guide — Make Tests Pass, Then Stop

## Overview

**Goal:** Build a conditional loop where a *command* (test runner) decides "done", not the agent.

**Key Concept:** The maker-checker split — opencode writes the fix, jest grades it.

---

## Quick Start

```bash
cd D:\giaic-marathon-projects\p2-test-loop
bash fix-loop.sh
```

---

## Project Structure

```
p2-test-loop/
├── src/math.js          # Buggy module (3 wrong implementations)
├── test/math.test.js    # 3 failing tests
├── package.json         # jest configured
├── fix-loop.sh          # The conditional loop script
├── progress.md          # Spine file (tracks attempts)
└── TESTING.md           # This file
```

---

## How the Loop Works

### Heartbeat
- **Type:** Shell `for` loop (Concept 5: conditional/run-until-done)
- **Cap:** 6 tries maximum

### Beat (one iteration)
1. `opencode run` — reads failing tests, tries to fix `src/math.js`
2. `npm test` — real command checks if tests pass
3. Exit code decides: `0` = done, non-zero = continue

### Checker
- **Tool:** jest (real test runner)
- **Why:** A command cannot convince itself the work is fine — this is proof, not a claim

### Spine
- `progress.md` — tracks what was tried each beat

---

## Expected Behavior

### Scenario 1: Tests Pass (Success)

```
=== Beat 1 of 6 ---
[16:30:05] Running checker: npm test
...
=== CONDITION MET on try 3 ===
All tests pass. Loop stopped because the WORK IS COMPLETE.
This is NOT the cap — the checker proved the work is done.
```

**What to verify:**
- Output says "CONDITION MET" (not "CAP HIT")
- `npm test` passes all 3 tests
- `src/math.js` has correct implementations

### Scenario 2: Cap Hit (Failure)

```
=== CAP HIT after 6 tries ===
Tests still failing. The loop stopped because of the LIMIT, not success.
Check progress.md for what was attempted.
```

**What this means:**
- opencode couldn't fix the tests in 6 tries
- Review `progress.md` to see what was attempted
- Consider improving the prompt or increasing the cap

---

## Verification Steps

### 1. Run the loop
```bash
bash fix-loop.sh
```

### 2. Check the stop condition
```bash
# Look for one of these in the output:
# ✅ "CONDITION MET" = success (tests pass)
# ❌ "CAP HIT" = hit the limit (tests still failing)
```

### 3. Verify the fix manually
```bash
npm test
# Should show: Tests: 3 passed, 3 total
```

### 4. Check what opencode did
```bash
cat src/math.js
# Should have correct implementations:
# add(a, b) → a + b
# multiply(a, b) → a * b
# divide(a, b) → a / b
```

### 5. Review the spine
```bash
cat progress.md
# Should show what was tried each beat
```

---

## Key Lessons to Observe

### 1. The Checker is a Real Command
- `npm test` is NOT the agent — it's jest
- The agent (opencode) writes the fix
- The command (jest) grades the fix
- This is the **maker-checker split** from Concept 11

### 2. Success = Tests Pass, Not Model Says "Done"
- The loop stops when `npm test` exits with code 0
- NOT when opencode says "I think it's fixed"
- This is the difference between a **claim** and a **proof**

### 3. The Cap Prevents Token Waste
- Without a cap, a stuck loop retries forever
- 6 tries is enough for simple bugs
- If it hits the cap, the prompt or stopping condition needs work

---

## Common Issues

### Issue: Tests still failing after fix
**Symptom:** opencode claims it fixed the tests, but `npm test` fails
**Cause:** opencode may have changed the tests instead of the implementation
**Fix:** The prompt says "Do NOT change the tests" — make sure opencode follows this

### Issue: Loop runs forever (no cap)
**Symptom:** The loop doesn't stop after 6 tries
**Cause:** The `for` loop syntax is wrong
**Fix:** Check `fix-loop.sh` — the `seq 1 $MAX_TRIES` should work on Windows Git Bash

### Issue: opencode doesn't run
**Symptom:** "opencode: command not found"
**Cause:** opencode is not in PATH
**Fix:** Run `opencode upgrade` or check installation

---

## Extending the Project

### Try harder bugs
Edit `src/math.js` to make the bugs more subtle:
```javascript
// Example: off-by-one error
function add(a, b) { return a + b - 1; }
```

### Add more tests
Add edge cases to `test/math.test.js`:
```javascript
test('add handles negative numbers', () => {
  expect(add(-1, 1)).toBe(0);
});
```

### Increase the cap
Edit `MAX_TRIES` in `fix-loop.sh`:
```bash
MAX_TRIES=10
```

### Add a progress log
Append to `progress.md` in the loop:
```bash
echo "Beat $i: $(date)" >> progress.md
```

---

## Concepts Used

| Concept | Where | Purpose |
|---------|-------|---------|
| Concept 5: Conditional Loop | `fix-loop.sh` | Run until tests pass |
| Concept 11: Maker-Checker | opencode writes, jest grades | Trust the result |
| Concept 13: Limit | `MAX_TRIES=6` | Prevent token waste |

---

## Commands to Remember

```bash
# Run the loop
bash fix-loop.sh

# Run tests manually
npm test

# Check the source file
cat src/math.js

# Check the spine
cat progress.md

# Reset to buggy state
git checkout src/math.js
```
