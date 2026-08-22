# Project 4: Fix Loop with Real Checker

> An implementer drafts, a separate reviewer grades, and only PASS opens a branch.

## What You Learn

- **Concept 8:** Worktree / isolation (branch per fix)
- **Concept 9:** Skill (reusable instructions)
- **Concept 11:** Maker-checker with a real subagent

## The Idea

A loop with TWO agents:
1. **Maker:** opencode runs the fix-bug skill to fix the code
2. **Checker:** a separate reviewer subagent grades the fix (PASS/FAIL)

The maker never grades its own work. The checker is read-only.

## Why a Separate Agent?

A test runner (jest) can only check:
- ✅ Does the code produce the right output?
- ❌ Is the code clean?
- ❌ Are there security issues?
- ❌ Did it follow the project's style?

A reviewer agent can check **all of these** because it can read and reason.

## The Maker-Checker Split

| Role | Who | What They Do |
|------|-----|-------------|
| **Maker** | opencode (with fix-bug skill) | Writes the fix |
| **Checker** | @reviewer subagent | Grades the fix (PASS/FAIL) |

**Key rule:** The agent that writes the fix must NOT approve it.

## How This Builds on Project 2

| Project 2 | Project 4 |
|-----------|-----------|
| Checker = command (`npm test`) | Checker = agent (`@reviewer`) |
| One agent does everything | Two agents: maker + checker |
| Skill = inline prompt | Skill = `.opencode/skills/fix-bug/SKILL.md` |
| No isolation | Branch per fix (worktree concept) |

## Files

| File | Purpose |
|------|---------|
| `src/calculator.js` | Module with a bug in `divide()` |
| `src/calculator.test.js` | Tests that expose the bug |
| `.opencode/skills/fix-bug/SKILL.md` | The fix instructions |
| `.opencode/agents/reviewer.md` | The checker agent |
| `fix-loop.sh` | The loop script |
| `progress.md` | The spine |

## The Bug

```javascript
// divide(10, 2) returns 20 (multiplication) instead of 5 (division)
function divide(a, b) {
  return a * b;  // BUG: should be a / b
}
```

## Setup

```bash
cd D:\giaic-marathon-projects\p4-fix-loop
npm install --save-dev jest
```

Add to package.json:
```json
"scripts": { "test": "jest --verbose" }
```

## Run

```bash
bash fix-loop.sh
```

## What "Done" Looks Like

- ✅ Tests pass (exit code 0)
- ✅ `src/calculator.js` has the correct fix (`a / b` not `a * b`)
- ✅ The divide-by-zero check is still there
- ✅ `progress.md` shows the fix was applied

## Key Lesson

The maker (opencode) writes the fix. The checker (reviewer) grades it. Never the same agent.
