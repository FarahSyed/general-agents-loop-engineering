# Rules for this repo

This is a **practice repo for loop engineering**. It is throwaway — never
treat anything in here as production code.

Two tracks:

- `claude-code/` — projects 1-8, uses Claude Code (`claude` CLI)
- `opencode/` — projects 9-16, uses OpenCode (`opencode` CLI)

## Loop safety rules (apply to every project)

- Every unattended loop (`/goal`, `/schedule`, a Routine, a GitHub trigger,
  a bash polling script, a cron job) must have a **cap**: max tries, max
  minutes, or "stop after N turns and write to progress.md."
- A stopping condition must be something a **command can prove** (a test
  passing, a script printing a number), not something only the agent's own
  opinion can confirm. If a project's condition can't be proven by a command,
  add a separate reviewer agent that grades it instead of trusting the maker.
- Never edit a checker (a test, a check script, a linter config) to make it
  pass. If a check is wrong, say so in progress.md and stop — do not weaken
  the check to reach "done."
- Any project with a `progress.md` must read it first and write it last on
  every beat. If there's nothing new, still write the date, so a human can
  tell the loop actually ran.
- Routines (cloud, Concept 6) can only push to `claude/`-prefixed branches
  in this repo. Do not turn off that restriction here.
