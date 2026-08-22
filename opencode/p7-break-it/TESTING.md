# Project 7: Testing Guide — Break It on Purpose

## Prerequisites

- Project 3 (morning brief) working
- Understanding of tokens and cost

## Step 1: Measure One Beat

Run the morning brief loop and count tokens:

```bash
cd D:\loop-engineering-projects\opencode\p7-break-it\morning-brief
bash morning-brief.sh
```

Note:
- Input tokens (what it reads)
- Output tokens (what it writes)
- Time taken

### Cost Calculation

```
tokens_per_run = input_tokens + output_tokens
runs_per_month = 30 (daily) or 365 (daily)
cost_per_token = $0.000003 (approximate for free models)

monthly_cost = tokens_per_run × runs_per_month × cost_per_token
```

**Example:**
- 5,000 tokens per run
- 30 runs/month
- $0.000003 per token
- Monthly cost: $0.45

## Step 2: Sabotage the Loop

### Option A: Missing File

Edit `morning-brief.sh`:

```bash
# Change this:
TODO_FILES=$(grep -r "TODO" src/ --include="*.js" -l)

# To this:
TODO_FILES=$(grep -r "TODO" nonexistent/ --include="*.js" -l)
```

### Option B: Impossible Condition

Edit `morning-brief.sh`:

```bash
# Add this near the end:
if [ "$NEW_TODOS" -ne 100 ]; then
  echo "FAIL: Expected 100 new TODOs, found $NEW_TODOS"
  exit 1
fi
```

### Option C: Trim Prompt

Edit `morning-brief.sh`:

```bash
# Replace the detailed prompt with:
echo "Find TODOs"
```

## Step 3: Let It Fail

```bash
bash morning-brief.sh
```

Watch it fail. Don't fix it.

## Step 4: Diagnose

After the loop fails:

1. Check `progress.md`:
   ```bash
   cat progress.md
   ```

2. Check the log:
   ```bash
   cat morning-brief.log 2>/dev/null || echo "No log file"
   ```

3. Answer without replaying:
   - What failed?
   - When did it fail?
   - Why did it fail?

## Step 5: Write Field Note

Create `field-note.md`:

```markdown
# Field Note: Loop Failure

## What Failed
[Your answer]

## When It Failed
[Your answer]

## Why It Failed
[Your answer]

## Loudest Failure
[Most obvious error]

## Quietest Failure
[Silent failure, if any]

## Alert Recommendation
[What you'd monitor in production]

## Monthly Cost
[Tokens × cadence × cost]
```
