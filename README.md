# Loop Engineering Projects

Practice repo for loop engineering. **Throwaway on purpose** — never treat
anything in here as production code.

Two tracks, same concepts, different agents:

| Track | Agent | Folder | Primitives |
|---|---|---|---|
| Claude Code | `claude` CLI | [`claude-code/`](claude-code/) | `/loop`, `/goal`, `/schedule`, `.claude/skills/`, `.claude/agents/` |
| OpenCode | `opencode` CLI | [`opencode/`](opencode/) | Bash wrappers, `opencode.json`, `.opencode/skills/`, `.opencode/agents/`, cron/GitHub Actions |

## How to work through this

```bash
cd loop-engineering-projects
git init && git add -A && git commit -m "scaffold"
```

Pick a track and `cd` into its folder. Each project is self-contained with
its own README giving you the exact commands to type.

## Claude Code track (projects 1-8)

```bash
cd claude-code
claude
```

Eight projects, easy to hard, using Claude Code's built-in commands: `/loop`,
`/goal`, `/schedule` (Routines), `--worktree`, `.claude/skills`,
`.claude/agents`, and GitHub connectors.

| # | Project | Concept | Time |
|---|---|---|---|
| 1 | [Watch loop](claude-code/project-1-watch-loop/) | In-session heartbeat | 15-30 min |
| 2 | [Make the tests pass, then stop](claude-code/project-2-tests-pass/) | Conditional loop + maker-checker | 30-45 min |
| 3 | [Morning brief with memory](claude-code/project-3-morning-brief/) | Schedule + spine | 45-60 min |
| 4 | [Fix loop with a real checker](claude-code/project-4-fix-loop/) | Worktree + skill + maker-checker | 1-2 hrs |
| 5 | [Codify the body](claude-code/project-5-codify-body/) | Workflows → `/command` | 1-1.5 hrs |
| 6 | [The doorbell loop](claude-code/project-6-doorbell/) | Event-driven Routine | 45-60 min |
| 7 | [Break it on purpose](claude-code/project-7-break-it/) | Observability + cost | 45-60 min |
| 8 | [Your own daily loop](claude-code/project-8-capstone/) | All six parts, one week live | 2-4 hrs |

## OpenCode track (projects 9-16)

```bash
cd opencode
opencode
```

Eight projects, easy to hard, using OpenCode's primitives: custom agents,
skills, commands, bash polling scripts, and external scheduling (cron /
GitHub Actions).

| # | Project | Concept | Time |
|---|---|---|---|
| 9 | [Watch loop](opencode/project-9-watch-loop/) | In-session heartbeat | 15-30 min |
| 10 | [Make the tests pass, then stop](opencode/project-10-tests-pass/) | Conditional loop + maker-checker | 30-45 min |
| 11 | [Morning brief with memory](opencode/project-11-morning-brief/) | Schedule + spine | 45-60 min |
| 12 | [Fix loop with a real checker](opencode/project-12-fix-loop/) | Worktree + skill + maker-checker | 1-2 hrs |
| 13 | [Codify the body](opencode/project-13-codify-body/) | Workflows → `/command` | 1-1.5 hrs |
| 14 | [The doorbell loop](opencode/project-14-doorbell/) | Event-driven | 45-60 min |
| 15 | [Break it on purpose](opencode/project-15-break-it/) | Observability + cost | 45-60 min |
| 16 | [Your own daily loop](opencode/project-16-capstone/) | All six parts, one week live | 2-4 hrs |

## The spine convention used throughout

Every project that needs memory writes to a `progress.md` in its own folder,
with this shape (copy it as a starting template):

```markdown
# Progress

## Last run: <date>
- What happened:
- What's still open:
- Needs a human?: yes/no — why
```

Read it first, write it last. That one habit is most of Concept 12.

## Loop safety rules (apply to every project)

- Every unattended loop must have a **cap**: max tries, max minutes, or
  "stop after N turns and write to progress.md."
- A stopping condition must be something a **command can prove** (a test
  passing, a script printing a number), not something only the agent's own
  opinion can confirm.
- Never edit a checker (a test, a check script, a linter config) to make it
  pass. If a check is wrong, say so in progress.md and stop.
