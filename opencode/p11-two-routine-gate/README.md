# Project 11: Build the Two-Routine Gate

> A drafts, you decide, and only your decision fires B.

## What You Learn

- **A3**: API trigger
- **A4**: The gate
- **A6**: The checklist

## The Idea

Build a two-step workflow:
1. Routine A drafts something (branch, summary, etc.)
2. You review the draft
3. Only your approval fires Routine B

This is the human gate from Part 5.

## Files

| File | Purpose |
|------|---------|
| `progress.md` | The spine |
| `README.md` | This file |
| `TESTING.md` | How to test |

## The Architecture

```
Routine A (drafts)
    ↓
You review
    ↓
You approve → curl fires Routine B
    ↓
Routine B executes
```

## Steps

### Step 1: Create Routine A (Drafter)

- Schedule: One-off
- Task: Draft something reviewable
- Output: A `claude/` branch or summary

### Step 2: Create Routine B (Executor)

- Trigger: API
- Task: One small follow-up action
- Store the bearer token immediately (shown once!)

### Step 3: Review A's Draft

- Read what A produced
- Decide if it's good

### Step 4: Fire B (if approved)

```bash
curl -X POST https://api.anthropic.com/v1/claude_code/routines/<routine-id>/fire \
  -H "Authorization: Bearer <routine-token>" \
  -H "anthropic-beta: experimental-cc-routine-2026-04-01" \
  -H "anthropic-version: 2023-06-01" \
  -H "Content-Type: application/json" \
  -d '{"text": "Approved. Proceed with the action."}'
```

### Step 5: Run the A6 Checklist

- [ ] Connectors pruned
- [ ] Unrestricted pushes off
- [ ] State file chosen

## "Done" Checklist

- [ ] B ran only because you fired it
- [ ] B's transcript shows the action happened
- [ ] A6 checklist completed for both routines
