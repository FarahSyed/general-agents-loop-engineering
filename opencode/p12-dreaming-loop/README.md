# Project 12: Build a Dreaming Loop

> A weekly loop that reads your other loops' logs and proposes rule changes as a PR.

## What You Learn

- **Concept 12**: Spine and improvement loop
- **Concept 11**: Maker-checker
- **Concept 6**: Schedule
- **Part 5**: Human gate

## The Idea

Build a meta-loop that:
1. Reads logs from other loops
2. Finds repeated failures
3. Proposes fixes as a PR
4. Never commits directly — always a PR for human review

This is the "dreaming" loop — it thinks about how to improve while you sleep.

## Files

| File | Purpose |
|------|---------|
| `dreaming-state.md` | Last date processed |
| `progress.md` | The spine |
| `README.md` | This file |
| `TESTING.md` | How to test |

## The Architecture

```
Weekly Schedule
    ↓
Read logs from other loops
    ↓
Find repeated failures
    ↓
Draft fix as PR
    ↓
Human reviews and merges
    ↓
Update dreaming-state.md
```

## Steps

### Step 1: Set Up the Prerequisite

You need a loop that has run for a week:
- Project 3 (morning brief) with dated entries in progress.md
- OR Project 8 (daily lint sweep) with dated entries

### Step 2: Create dreaming-state.md

```markdown
# Dreaming State

## Last Processed
2026-08-01

## Rules
<!-- Rules discovered from logs -->
```

### Step 3: Build the Dreaming Loop

**Prompt:**
```
Read dreaming-state.md to find the last processed date.
Read all log entries in progress.md since that date.
Look for any failure or correction that appears more than once.
Draft the smallest rules-file or skill change that would prevent it.
Create a PR on a claude/ branch with:
- The proposed change
- Evidence: which runs, how often, why this line stops it
- One deletion: a rule no recent run needed
Update dreaming-state.md with today's date.
```

### Step 4: Schedule It

```bash
/schedule weekly on Monday at 9am, [the prompt above]
```

### Step 5: Let It Run for a Week

- Let the dreaming loop run weekly
- Read every PR it creates
- Decide what to merge

## "Done" Checklist

- [ ] PR's proposed change traces to real, cited log entries
- [ ] A planted repeated failure gets caught
- [ ] Nothing changed without you merging it
