---
name: morning-brief
description: Gather TODO comments and recent commits, summarize, and update progress.md. Use for the daily morning-brief loop.
---

# Morning brief

1. Read `progress.md` in the repo root first. Note what the last run already
   reported — do not repeat it.
2. Gather what's new since the last run:
   - `grep -rn "TODO" --include=*.* .` for open TODO comments
   - `git log --since="1 day ago" --oneline` for recent commits (if this is
     a git repo with history)
3. Write a short summary (5 lines max): how many TODOs, how many commits,
   anything that looks urgent (a TODO containing "FIXME" or "urgent").
4. Append a new dated entry to `progress.md` using the template below. Do
   not delete previous entries — this file is the loop's only memory.

## progress.md entry template

```markdown
## Last run: <date>
- TODOs found: <n> (new since last run: <n>)
- Commits since last run: <n>
- Urgent: <yes/no — what>
- Needs a human?: no
```
