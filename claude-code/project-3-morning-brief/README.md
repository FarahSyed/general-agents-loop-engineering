# Project 3 — The morning brief with a memory

**Difficulty:** medium · **Uses:** Concept 6 (unattended schedule),
Concept 12 (the spine) · **Time:** 45-60 min

## Build

```bash
cd project-3-morning-brief
git init -q && git add -A && git commit -q -m "seed"
# make a couple of fake TODOs and commits so there is something to find
echo "// TODO: handle empty input" >> src-placeholder.txt
git add -A && git commit -q -m "add placeholder TODO"
claude
```

First, prove it works by hand, once, before scheduling anything:

```text
run the morning-brief skill for today
```

Check `progress.md` — it should now have one dated entry.

Then make it a real loop:

```text
/schedule every day at 9am, run the morning-brief skill and write me the
forecast
```

Or, to test the schedule without waiting for tomorrow, fire a one-off
first (one-offs don't count against your daily Routine cap):

```text
/schedule in 2 minutes, run the morning-brief skill
```

Add another TODO or commit, wait for the second fire, then check
`progress.md` again.

## Done when

You run it (at least) twice and the second run **clearly builds on the
first** — it reports only what's new since the last entry, not a repeat of
everything. That proves the spine works. If the second run looks like the
first run copy-pasted, the skill isn't actually reading `progress.md`
first — fix that before scheduling it for real.

## What this proves

The model itself remembers nothing between beats — every scheduled run is
a brand-new session. `progress.md` is the only thing carrying state from
yesterday's run into today's. Read it first, write it last: that's the
entire spine pattern, and it's the part most people forget until their
second scheduled run comes back with no idea what happened yesterday.
