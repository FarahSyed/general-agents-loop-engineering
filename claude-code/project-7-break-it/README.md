# Project 7 — Break it on purpose

**Difficulty:** medium · **Uses:** observability, Concept 13 (cost),
Concept 14 · **Time:** 45-60 min

## Part A: measure a healthy beat first

Reuse (or rebuild) your Project 3 morning-brief loop here, and fire it
once by hand:

```bash
cd project-7-break-it
claude
```

```text
run the morning-brief-style skill for today (copy it from project-3 if
needed) and report your token usage for this run
```

Note roughly how many tokens one beat reads and writes. Multiply by your
intended cadence (e.g. daily = ×30/month) to get a rough monthly cost.
Write that number down — you'll compare it after the sabotage below.

## Part B: sabotage it, on purpose, while you're watching

The `flaky-check` skill here is rigged to fail: step 2 reads
`does-not-exist.txt`, which deliberately isn't in this folder. Set a real
limit before you fire it — this is the part people skip and then regret at
3am:

```text
/goal use the flaky-check skill. Stop after 4 tries if you can't complete
it, and write exactly what's blocking you to progress.md before stopping.
```

## Done when — diagnose from the spine alone

Without replaying the session, using **only** what the loop left behind
(the log output and `progress.md`), answer:

1. What failed, and roughly when?
2. Did the loop leave a clear "needs a human" note, or did it fail
   silently? If silently, that's the bug to fix — add an explicit
   "if you cannot complete the task, write why to progress.md" instruction
   to any loop you build from here on, including Project 8's.
3. What's your loop's monthly cost at its intended cadence, from Part A?

## Why this project exists

This is the rehearsal for the failure you don't want to discover for the
first time overnight, unattended, when you're asleep. A loop that fails
loudly into its spine is recoverable in five minutes the next morning. A
loop that fails silently just... doesn't run, and you won't know until
something downstream is missing for days.
