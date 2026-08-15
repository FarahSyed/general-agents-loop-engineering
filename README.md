# Loop Engineering Projects (Claude Code)

Eight projects, easy to hard, that build the six parts of a loop (heartbeat,
worktree, skill, maker-checker, connector, spine) using Claude Code's
built-in commands: `/loop`, `/goal`, `/schedule` (Routines), `--worktree`,
`.claude/skills`, `.claude/agents`, and GitHub connectors.

**This is a throwaway repo.** That's on purpose (rule 1 from the source
material). Loops edit files on their own while you're not watching — don't
point your first ones at work you care about.

**Rule 2: always set a limit first.** Every project below caps its tries,
minutes, or turns before you let anything run unattended.

## How to work through this

```bash
cd loop-engineering-projects
git init && git add -A && git commit -m "scaffold"
claude
```

Say **yes** when it asks whether you trust the folder — that's what lets a
loop run without stopping to ask permission every step.

Then `cd` into each project folder in order (or jump to the one you want —
each README is self-contained) and follow its instructions. Every project's
README gives you the *exact* line to type into Claude Code — nothing here
requires you to write scheduler code by hand, because that's the whole point
of the Claude Code path.

## Map

| # | Project | Concept | Time |
|---|---|---|---|
| 1 | [Watch loop](project-1-watch-loop/) | In-session heartbeat | 15-30 min |
| 2 | [Make the tests pass, then stop](project-2-tests-pass/) | Conditional loop + maker-checker | 30-45 min |
| 3 | [Morning brief with memory](project-3-morning-brief/) | Schedule + spine | 45-60 min |
| 4 | [Fix loop with a real checker](project-4-fix-loop/) | Worktree + skill + maker-checker | 1-2 hrs |
| 5 | [Codify the body](project-5-codify-body/) | Workflows → `/command` | 1-1.5 hrs |
| 6 | [The doorbell loop](project-6-doorbell/) | Event-driven Routine | 45-60 min |
| 7 | [Break it on purpose](project-7-break-it/) | Observability + cost | 45-60 min |
| 8 | [Your own daily loop](project-8-capstone/) | All six parts, one week live | 2-4 hrs |

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
