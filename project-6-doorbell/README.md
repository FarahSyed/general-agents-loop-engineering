# Project 6 — The doorbell loop

**Difficulty:** medium · **Uses:** Concept 7 (event-driven), Concept 10
(connectors) · **Time:** 45-60 min

This one needs a real GitHub repo (private is fine) since it's triggered by
GitHub events, not by a local file. It won't run purely locally.

## Setup

```bash
cd project-6-doorbell
git init -q && git add -A && git commit -q -m "seed"
gh repo create <you>/loop-eng-doorbell --private --source=. --push
```

## Build

1. On `claude.ai/code/routines` (or Desktop, or `/schedule` in the CLI —
   same underlying feature from any of the three), create a new Routine:
   - **Prompt:** "Use the pr-reviewer subagent to review the pull request
     that triggered this run. Post findings as a PR comment. Do not close
     or merge anything."
   - **Repo:** only `<you>/loop-eng-doorbell` — nothing else.
   - **Connector:** GitHub only.
   - **Trigger:** GitHub event → "pull request opened" (and "synchronize,"
     so a new push to the same PR re-fires it).

2. Plant one bug on top of the clean `hasStock` function above, e.g.:

   ```js
   return item != null || item.quantity > 0; // bug: || should be &&
   ```

3. Push it on a branch and open a PR.

## Done when

The PR gets a review comment you never asked for, flagging the planted
bug. Push a fix to the same PR (which fires the `synchronize` event) and
confirm a second, unrequested review comment shows up — that re-fire *is*
the event heartbeat working, distinct from a schedule that fires on a
clock regardless of activity.

## What this proves

Together with Projects 1-3, this completes all four heartbeats: in-session
(1), conditional (2), scheduled (3), event-driven (6). The event heartbeat
is the "doorbell": it stays silent on a quiet day (no PRs, zero runs) and
fires immediately, repeatedly if needed, the moment something happens —
the opposite of a schedule, which reports on a clock whether or not
there's anything to say.
