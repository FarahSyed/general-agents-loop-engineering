# Progress — Project 7: Break It on Purpose

## Goal
Sabotage a working loop, diagnose from the spine alone, measure cost.

## Steps

### Step 1: Measure One Beat
- [x] Run morning brief loop once
- [x] Count input tokens
- [x] Count output tokens
- [x] Calculate monthly cost

### Step 2: Sabotage the Loop
- [x] Choose sabotage method (A, B, or C)
- [x] Apply sabotage to morning-brief.sh
- [x] Verify loop is broken

### Step 3: Let It Fail
- [x] Run sabotaged loop
- [x] Let it fail without intervention
- [x] Observe output

### Step 4: Diagnose from Spine
- [x] Read progress.md
- [x] Read log file
- [x] Identify what failed
- [x] Identify when it failed
- [x] Identify why it failed

### Step 5: Write Field Note
- [x] Document loudest failure
- [x] Document quietest failure
- [x] Recommend alerts for production

## Attempts

### Attempt 1: 2026-08-22 16:39:02
- **Sabotage method:** Pointed at nonexistent/ directory
- **Result:** Loop completed but reported 0 TODOs (should be 9)
- **Failure type:** Quiet — no error, wrong results
- **Diagnosis:** Script scanned wrong directory
- **Lesson:** Silent failures hide in production
