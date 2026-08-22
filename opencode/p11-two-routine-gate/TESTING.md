# Project 11: Testing Guide — Two-Routine Gate

## Prerequisites

- Claude Code CLI or Claude.ai
- API trigger capability

## Step 1: Create Routine A (Drafter)

### Claude Code CLI

```bash
/schedule now, create a branch called claude/draft and add a file called draft.txt with today's date
```

### Claude.ai

1. Create routine "Draft Creator"
2. Prompt: "Create a branch called claude/draft and add a file called draft.txt with today's date"
3. Schedule: One-off (Run now)

## Step 2: Create Routine B (Executor)

1. Create routine "Action Executor"
2. Prompt: "Append 'Action completed at <timestamp>' to draft.txt and commit"
3. Trigger: API
4. **Save the bearer token immediately!** It's shown once.

## Step 3: Review A's Draft

After A runs:
1. Check the `claude/draft` branch
2. Read `draft.txt`
3. Decide if it looks correct

## Step 4: Fire B (If Approved)

If the draft looks good, fire B:

```bash
curl -X POST https://api.anthropic.com/v1/claude_code/routines/<B-routine-id>/fire \
  -H "Authorization: Bearer <B-bearer-token>" \
  -H "anthropic-beta: experimental-cc-routine-2026-04-01" \
  -H "anthropic-version: 2023-06-01" \
  -H "Content-Type: application/json" \
  -d '{"text": "Approved. Proceed with the action."}'
```

## Step 5: Verify

1. Check B's transcript
2. Confirm the action happened
3. Verify the commit exists

## A6 Checklist

Run this checklist for both routines:

| Check | Routine A | Routine B |
|-------|-----------|-----------|
| Connectors pruned | [ ] | [ ] |
| Unrestricted pushes off | [ ] | [ ] |
| State file chosen | [ ] | [ ] |

## Commands

```bash
# List routines
/schedule list

# Get routine details
/schedule list <routine-id>

# Update routine
/schedule update <routine-id> "new prompt"
```
