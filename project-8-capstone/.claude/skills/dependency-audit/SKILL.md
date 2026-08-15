---
name: dependency-audit
description: Check for outdated or vulnerable dependencies, draft safe version bumps in a worktree, and report anything risky. Use for the weekly capstone loop.
---

# dependency-audit

1. Read `progress.md` first — note what was already flagged last run.
2. Run `npm outdated --json` (or the equivalent for this project's package
   manager) and `npm audit --json`.
3. For dependencies that are only a patch or minor version behind with no
   known vulnerabilities: draft the bump in a separate worktree on branch
   `deps/<date>`, run the test suite there, and if it passes, this is safe
   — hand it to the connector step to open a PR.
4. For anything major-version, breaking, or with a vulnerability: do NOT
   touch it. Write it to `progress.md` under "needs a human" with why.
5. Update `progress.md`: what was bumped, what was flagged, and the date.
