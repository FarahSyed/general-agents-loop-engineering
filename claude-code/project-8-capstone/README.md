# Project 8 — Your own daily loop (the capstone)

**Difficulty:** capstone · **Uses:** all six parts · **Time:** 2-4 hrs,
then run unattended for a week

## Pick the chore

The scaffold here is a **dependency audit**, one of the source material's
suggested chores. If you'd rather do a docs-freshness check, a changelog
draft, or a lint sweep against a real project you own, swap the skill in
`.claude/skills/dependency-audit/` for your own — the six-part shape below
doesn't change.

## The six parts, mapped to files already in this folder

| Part | Where |
|---|---|
| 1. Heartbeat | `/schedule` command below |
| 2. Worktree | step 3 of the skill — bumps happen in `deps/<date>`, never on your working branch |
| 3. Skill | `.claude/skills/dependency-audit/SKILL.md` |
| 4. Subagent (maker-checker) | `.claude/agents/dep-reviewer.md` grades the maker's draft |
| 5. Connector | GitHub, to open the PR — attach only what the Routine needs |
| 6. Spine | `progress.md`, including a budget guard already written in |

## Build

```bash
cd project-8-capstone
git init -q && git add -A && git commit -q -m "capstone seed"
claude
```

Prove it once by hand first:

```text
run the dependency-audit skill now
```

Check `progress.md` for a sensible entry. Then, once you trust one manual
run, schedule it:

```text
/schedule every Monday at 9am, run the dependency-audit skill, have the
dep-reviewer subagent grade any drafted bump, and open a PR only on PASS
```

## Done when

It's run **unattended for a week**, and you trust what it ships **because
you read it** — not because you stopped reading. Concretely: check every
PR it opened that week before merging, at least until you've seen several
clean runs.

## The honest last question

Concept 15, asked straight: did your understanding of the project keep up
with what the loop changed, or did you start rubber-stamping its PRs
without really reading them? If the answer is the second one, **slow the
loop down** — widen the human gate, shorten the cadence, or narrow what it
can touch — until your reading keeps pace with its output again. A loop
you no longer read is a loop you no longer own.

If it fails overnight (it will, eventually) — walk through the diagnosis
habit from Project 7 before assuming the model is at fault. Check
`progress.md` first.
