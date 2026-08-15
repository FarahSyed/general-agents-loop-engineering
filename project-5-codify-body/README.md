# Project 5 — Codify the body

**Difficulty:** medium to hard · **Uses:** the dynamic-workflows pattern,
Concepts 8 and 11 · **Time:** 1-1.5 hrs

> Dynamic workflows are a research preview in Claude Code. Where this
> project and the live docs (`code.claude.com/docs`) disagree, the docs win.

## Setup

Copy the fix loop from Project 4 into this folder so you have real material
to codify — or point at three real small issues in a repo you own, if you
have one.

```bash
cp -r ../project-4-fix-loop/src .
cp -r ../project-4-fix-loop/test .
cp -r ../project-4-fix-loop/.claude/skills .claude/
cp -r ../project-4-fix-loop/.claude/agents .claude/
```

## Build

```bash
cd project-5-codify-body
claude
```

Describe the whole orchestration in plain words, and let the runtime write
and run it as a workflow:

```text
use a workflow to draft fixes for three candidate issues in parallel
worktrees, using the triage-fix skill, and have the reviewer subagent
grade each one, reporting PASS/FAIL per candidate
```

When a run does what you want, save it as a reusable command from the
`/workflows` view:

```text
/workflows
```

Then save it — check the current UI for the exact save action, since this
is a research-preview surface. Once saved, it becomes callable as, e.g.:

```text
/fix-candidates
```

Run the saved command a second time to confirm it reproduces the same
orchestration without you re-describing it.

## Then: prove it is NOT a loop

Start a **fresh session** (or close and reopen the terminal), then ask:

```text
what happened last time /fix-candidates ran?
```

## Done when

Both of these are true:

1. One command runs the whole draft-and-review body — several candidates,
   isolated worktrees, and a verdict for each — with no step-by-step
   prompting from you.
2. You've proven, on your own machine, that the fresh session remembers
   nothing about the last run. Name out loud what turning this into a real
   *loop* (not just a reusable *command*) would need: a heartbeat to fire
   it (Concept 6 or 7) and a `progress.md` its agents actually write to
   (Concept 12).

If you can name those two missing pieces, you've understood the
difference between an **engine** (codified orchestration you fire by hand)
and a **loop** (the same engine plus a heartbeat and a spine that carries
state to the next fire).
