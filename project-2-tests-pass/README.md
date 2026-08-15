# Project 2 — Make the tests pass, then stop

**Difficulty:** easy to medium · **Uses:** Concept 5 (conditional loop),
Concept 11 (maker-checker) · **Time:** 30-45 min

## Setup (already done for you)

`src/add.js` has three planted bugs. `test/add.test.js` genuinely fails
against it right now — verified: `npm test` exits 1 with `# fail 1` (only
one of the three tests happens to fail first; fixing it can reveal the
next). This is a **real command as checker**, not an agent's opinion.

## Build

```bash
cd project-2-tests-pass
claude
```

```text
/goal All tests in test/ pass (npm test exits 0). Do not edit test/add.test.js
under any circumstances — only fix src/add.js. Stop after 6 tries and tell
me what's still failing if you can't get there.
```

Walk away. `/goal`'s checker (a separate smaller model reading the
transcript, not the same agent that wrote the fix) will only confirm
"done" when it sees the actual `npm test` output printed showing a pass —
this is the "visible evidence" rule: the checker can't run commands
itself, only read what the worker printed.

## Done when

The loop stops because `npm test` **actually** passed — not because it hit
the 6-try cap. If it keeps hitting the cap, that's the lesson: your
stopping condition or prompt needs to be more specific (e.g. name the bug
category, or point at `src/add.js` explicitly).

## The trap to notice

The one rule in the prompt — "do not edit test/add.test.js" — exists
because a loop optimizing purely for "tests pass" will happily rewrite the
test to match the buggy behavior instead of fixing the bug. Try removing
that rule and running `/goal` again on a fresh copy of the buggy source to
see it happen. That's the sharpest lesson in this project: a checker that
the maker can also edit is not a checker.
