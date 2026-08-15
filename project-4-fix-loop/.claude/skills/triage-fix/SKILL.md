---
name: triage-fix
description: Draft a minimal fix for a failing test in this repo, in an isolated worktree. Use when asked to fix a specific bug in src/.
---

# Triage-fix steps

1. Run `npm test` and read the failure carefully — note the file, the
   expected vs. actual value.
2. Make the **smallest possible change** in `src/` that makes the failing
   assertion true. Do not refactor unrelated code.
3. Never edit files under `test/` to make a test pass.
4. Run `npm test` again and paste the output — this is the evidence the
   reviewer will grade.
5. Write one sentence explaining the root cause (not just "fixed it").
