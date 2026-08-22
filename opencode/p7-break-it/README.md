# Project 7: Break It on Purpose

> Sabotage your own loop, then diagnose it from the spine alone.

## What You Learn

- **Observability** — diagnosing failures from logs
- **Concept 13** — cost math (tokens × cadence = monthly cost)
- **Concept 14** — budget guards

## The Idea

Take a working loop, break it on purpose, then figure out what went wrong using only the spine (progress.md and logs). This reheapses the overnight failure while it's cheap and you're watching.

## Files

| File | Purpose |
|------|---------|
| `morning-brief/` | The Project 3 loop (base) |
| `progress.md` | The spine |
| `README.md` | This file |
| `TESTING.md` | How to test |

## Steps

### Step 1: Measure one beat

Run the morning brief loop once and note:
- How many tokens it reads
- How many tokens it writes
- Multiply by cadence (e.g., daily = 30 runs/month)

**Formula:** `tokens_per_run × runs_per_month × cost_per_token = monthly_cost`

### Step 2: Sabotage the loop

Choose ONE of these sabotage methods:

**Option A: Point at a file that doesn't exist**
- Edit `morning-brief.sh` to read from `nonexistent.txt`
- The loop will fail when it tries to read the missing file

**Option B: Impossible success condition**
- Edit `morning-brief.sh` to require "100% completion"
- The loop will never satisfy this condition

**Option C: Trim prompt to one sentence**
- Remove all context from the prompt
- The loop will limp along with degraded results

### Step 3: Let it fire on schedule

- Run the sabotaged loop
- Let it fail
- Don't intervene

### Step 4: Diagnose from the spine alone

After the loop fails:
1. Read `progress.md` — what does it say?
2. Read the log file — what error appears?
3. **Without replaying the full run**, answer:
   - What failed?
   - When did it fail?
   - Why did it fail?

### Step 5: Write a field note

Answer these questions:
1. Which failure was loudest? (obvious error, clear message)
2. Which was quietest? (silent failure, no error)
3. What would you put in an alert if this were a live system?

## "Done" Checklist

- [ ] You can say what failed and when, from the spine alone
- [ ] The loop left a clear "needs a human" note instead of failing silently
- [ ] You know your loop's monthly cost at current cadence
