# Project 9: Testing Guide — Rehearse a Routine

## Prerequisites

- Claude Code CLI or Claude.ai access
- A git repository

## Step 1: Create a Routine

### Option A: Claude Code CLI

```bash
# Create a routine that summarizes commits
/schedule now, summarize the last 5 commits in this repo
```

### Option B: Claude.ai

1. Go to claude.ai/code/routines
2. Create a new routine
3. Prompt: "Summarize the last 5 commits in this repo"
4. Do NOT set a repeating schedule

## Step 2: Fire First Run (Success)

Run the routine once. It should:
- Read the git log
- Summarize the commits
- Post the summary

Read the full transcript. What does it show?

## Step 3: Fire Second Run (Failure)

Change the prompt to fail:

```bash
/schedule now, read the file called nonexistent.txt and summarize it
```

Or in Claude.ai:
1. Edit the routine prompt
2. Change to: "Read nonexistent.txt and summarize it"
3. Run it once

## Step 4: Compare Runs

| Run | Status | Transcript |
|-----|--------|------------|
| 1 | Green | Shows successful summary |
| 2 | Green | Shows error reading file |

Both are green! But one worked, one failed.

## Step 5: Answer the Question

**Why couldn't the status column tell them apart?**

Because green means:
- The session started
- The session ended
- No infrastructure error

It does NOT mean:
- The task succeeded
- The file was found
- The work was correct

**The lesson:** Always read the transcript, not just the status.

## Commands

```bash
# List routines
/schedule list

# Run a routine now
/schedule run <routine-id>

# Update a routine
/schedule update <routine-id> "new prompt"
```
