# Project 8: Testing Guide — Daily Loop

## Prerequisites

- Node.js installed
- ESLint installed

## Setup

```bash
cd D:\loop-engineering-projects\opencode\p8-daily-loop
npm install
```

## Test the Loop

### Step 1: Run the lint sweep manually

```bash
bash lint-sweep.sh
```

### Step 2: Check the output

You should see:
- ESLint running
- Issues being counted
- Auto-fixable issues being fixed
- CHANGELOG.md being updated
- progress.md being updated

### Step 3: Check the spine

```bash
cat progress.md
```

You should see a new run entry.

### Step 4: Check the changelog

```bash
cat CHANGELOG.md
```

You should see a new entry with the lint results.

## Verify the Six Parts

| Part | How to Verify |
|------|---------------|
| **Heartbeat** | Set up a cron job or GitHub Actions schedule |
| **Worktree** | Each run starts fresh (no state between runs) |
| **Skill** | The `lint-sweep` skill exists in `.opencode/skills/` |
| **Maker-Checker** | Script fixes issues, then verifies |
| **Connector** | Git commit happens automatically |
| **Spine** | `progress.md` tracks all runs |

## Set Up the Heartbeat (Daily Schedule)

### Option 1: Cron Job (Linux/Mac)

```bash
# Edit crontab
crontab -e

# Add this line (runs daily at 9 AM)
0 9 * * * cd /path/to/p8-daily-loop && bash lint-sweep.sh >> lint-sweep.log 2>&1
```

### Option 2: GitHub Actions

Create `.github/workflows/daily-lint.yml`:

```yaml
name: Daily Lint Sweep

on:
  schedule:
    - cron: '0 9 * * *'  # Daily at 9 AM UTC
  workflow_dispatch:  # Allow manual trigger

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm install
      - run: bash lint-sweep.sh
      - uses: stefanzweifel/git-auto-commit-action@v5
        with:
          commit_message: "Lint sweep: auto-fix"
```

## Budget Guards

The loop has these guards:

- **Max tokens:** 10,000 per run
- **Max runtime:** 5 minutes
- **Max files changed:** 10

If any guard is exceeded, the loop should stop and report the issue.

## "Done" Checklist

- [ ] Loop runs unattended for 7 days
- [ ] You read every output
- [ ] You trust what it ships
- [ ] Your understanding kept up with changes
