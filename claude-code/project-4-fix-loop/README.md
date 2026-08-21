# Project 4 — A fix loop with a real checker

**Difficulty:** medium to hard · **Uses:** Concept 8 (worktree), Concept 9
(skill), Concept 11 (maker-checker) · **Time:** 1-2 hrs

## Setup (already done for you)

`src/buggy.js` has a genuine off-by-one bug in `paginate`. `test/buggy.test.js`
fails against it right now — verified: `npm test` → `# fail 1`. The
`triage-fix` skill and a dedicated `reviewer` subagent (`.claude/agents/reviewer.md`)
are already in place; the reviewer's whole job is to grade, never to fix.

## Build

```bash
cd project-4-fix-loop
git init -q && git add -A && git commit -q -m "seed with known bug"
claude
```

Draft the fix in its own worktree so it can't touch your main checkout
while you're reviewing:

```text
use the triage-fix skill to fix the failing test, working in a separate
worktree on branch fix/pagination
```

Then have the **reviewer subagent** — not the same agent that just wrote
the fix — grade it:

```text
have the reviewer subagent grade the diff on branch fix/pagination against
the test output. reply PASS or FAIL only after checking it yourself.
```

Only merge / open a PR on `PASS`.

## Then: plant a bad fix on purpose

To prove the checker isn't rubber-stamping everything, deliberately break
it. Revert to the buggy source, then ask for a fix that hardcodes the test's
expected values instead of fixing the root cause (e.g. `if (pageNumber ===
1) return items.slice(0,3)`), and send *that* to the reviewer.

## Done when

Both of these are true:

- A genuinely correct fix gets `PASS` and would be safe to open a PR from.
- The deliberately bad (hardcoded / special-cased) fix gets `FAIL`, with
  the reviewer's reasons naming *why* — not just tests-pass-so-it's-fine.

If the reviewer passes the bad fix, your checker is too soft — tighten
`reviewer.md`'s instructions (e.g. explicitly ban hardcoded literals that
match test inputs) and try again. **A checker that approves everything is
no checker.**
