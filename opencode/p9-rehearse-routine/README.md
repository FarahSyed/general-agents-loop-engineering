# Project 9: Rehearse a Routine for Free

> Prove a prompt with one-off runs before you commit it to a schedule.

## What You Learn

- **A1**: A local session is not a cloud Routine
- **A3**: One-off schedules
- **A5**: Reading runs (green means session ended, not task succeeded)

## The Idea

Before putting a routine on a repeating schedule, test it with one-off runs. See both success and failure. Learn that "green" doesn't mean "worked."

## Files

| File | Purpose |
|------|---------|
| `progress.md` | The spine |
| `README.md` | This file |
| `TESTING.md` | How to test |

## Steps

### Step 1: Create a Routine

Create a routine that does one small, checkable thing:
- Summarize yesterday's commits
- Read a file and report its contents
- Run a simple command

### Step 2: Fire a One-Off Run (Success)

```bash
# In Claude Code CLI:
/schedule tomorrow at 9am, summarize yesterday's commits
```

Or use "Run now" in the UI.

Read the full transcript — not just the status column.

### Step 3: Fire a One-Off Run (Failure)

Change the prompt so it must fail:
- Point at a file that doesn't exist
- Give it an impossible task

Fire it once more.

### Step 4: Compare

You should see two green runs:
1. One whose transcript shows success
2. One whose transcript shows failure

### Step 5: Answer

Why couldn't the status column tell them apart?

**Answer:** Green means the session ended without an infrastructure error, nothing more.

## "Done" Checklist

- [ ] You have seen two green runs
- [ ] One succeeded, one failed
- [ ] You can explain why status column couldn't tell them apart
