# Project 8: Your Own Daily Loop (Capstone)

> The full six-part loop on a real chore, run unattended for a week.

## What You Learn

- **All six parts**: heartbeat, worktree, skill, maker-checker, connector, spine
- **Concept 13**: budget guards
- **Concept 15**: did your understanding keep up with the loop?

## The Idea

Pick a real, boring, recurring chore and build a complete loop around it. Let it run unattended for a week. Trust what it ships because you read it, not because you stopped reading.

## Chosen Chore: Lint Sweep

A daily loop that:
1. Runs ESLint on the codebase
2. Fixes auto-fixable issues
3. Reports unfixable issues
4. Updates a changelog

## Files

| File | Purpose |
|------|---------|
| `src/` | Sample code to lint |
| `package.json` | Dependencies (ESLint) |
| `lint-sweep.sh` | Main loop script |
| `progress.md` | The spine |
| `.opencode/skills/lint-sweep/SKILL.md` | The skill |
| `CHANGELOG.md` | Auto-updated changelog |
| `README.md` | This file |
| `TESTING.md` | How to test |

## The Six Parts

| Part | What It Does |
|------|--------------|
| **Heartbeat** | Scheduled (daily at 9 AM) |
| **Worktree** | Fresh clone each run |
| **Skill** | `lint-sweep` skill |
| **Maker-Checker** | Maker fixes, checker verifies |
| **Connector** | GitHub push + changelog |
| **Spine** | progress.md tracks runs |

## Budget Guards

- Max tokens per run: 10,000
- Max runtime: 5 minutes
- Max changes per run: 10 files

## "Done" Checklist

- [ ] Loop runs unattended for 7 days
- [ ] You read every output
- [ ] You trust what it ships
- [ ] Your understanding kept up with changes
