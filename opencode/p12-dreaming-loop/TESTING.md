# Project 12: Testing Guide — Dreaming Loop

## Prerequisites

- A loop that has run for a week (Project 3 or 8)
- Dated entries in progress.md

## Step 1: Plant a Repeated Failure

Add this to your progress.md (from Project 3 or 8):

```markdown
## Run: 2026-08-15
- **Status:** FAILED
- **Error:** Could not find file nonexistent.txt

## Run: 2026-08-16
- **Status:** FAILED
- **Error:** Could not find file nonexistent.txt

## Run: 2026-08-17
- **Status:** FAILED
- **Error:** Could not find file nonexistent.txt
```

This simulates a repeated failure.

## Step 2: Create dreaming-state.md

```markdown
# Dreaming State

## Last Processed
2026-08-01

## Rules
<!-- Empty initially -->
```

## Step 3: Create the Dreaming Loop

### Claude Code CLI

```bash
/schedule weekly on Monday at 9am, read dreaming-state.md to find the last processed date. Read all log entries in progress.md since that date. Look for any failure that appears more than once. Draft the smallest rules change that would prevent it. Create a PR on a claude/ branch with the proposed change and evidence. Update dreaming-state.md with today's date.
```

### Claude.ai

1. Create routine "Dreaming Loop"
2. Prompt: [same as above]
3. Schedule: Weekly on Monday at 9am

## Step 4: Run It Manually (First Time)

```bash
/schedule run <dreaming-loop-id>
```

## Step 5: Check the PR

1. Go to your repo
2. Look for a PR on a `claude/` branch
3. Read the proposed change
4. Verify it cites real log entries

## Step 6: Verify

| Check | Expected |
|-------|----------|
| PR cites real logs | Yes, with run dates and error messages |
| Change is minimal | Smallest possible fix |
| Includes a deletion | One unused rule removed |
| dreaming-state.md updated | Date changed to today |

## The Human Gate

**Never merge automatically.** Always:
1. Read the PR
2. Verify the evidence
3. Decide if the change makes sense
4. Merge manually

An improvement loop that guesses is worse than no improvement loop.
