# Field Note: Loop Failure

## What Failed
The loop reported 0 TODOs when there are actually 9 in the codebase.
It scanned the wrong directory and gave wrong results.

## When It Failed
Run 5 (2026-08-22 16:39:02) — first run after sabotage.

## Why It Failed
The script was pointed at "nonexistent/" instead of "src/".
Grep found nothing in a directory that doesn't exist.

## Loudest Failure
None — the loop completed without errors. No crash, no exit code 1.

## Quietest Failure
This one. The loop finished "successfully" but gave wrong results.
The spine showed "Found 0 TODO comments" when there are 9.
This is the most dangerous failure — it hides in production.

## Alert Recommendation
Alert when TODO count drops to 0 unexpectedly.
If previous runs found TODOs and current run finds 0, something is wrong.
Also alert when the scanned directory changes between runs.

## Monthly Cost
- Tokens per run: ~500
- Runs per month: 30 (daily)
- Cost per token: $0.000003
- Monthly cost: ~$0.005

## Lessons Learned
1. Silent failures are more dangerous than crashes
2. The spine (progress.md) is your detective — read it
3. Always compare current run to previous runs
4. The loop said "Done" even when it was wrong
