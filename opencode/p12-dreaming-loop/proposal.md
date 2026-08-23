# Proposal — Dreaming Loop Rules Change

## Evidence

| Date | Error | Count |
|------|-------|-------|
| 2026-08-15 | Could not find file nonexistent.txt | 1 |
| 2026-08-16 | Could not find file nonexistent.txt | 1 |
| 2026-08-17 | Could not find file nonexistent.txt | 1 |

**Total occurrences:** 3 of 7 runs (43% failure rate)

## Proposed Rule Addition

```
## Rules
- Verify that referenced files exist before processing them.
```

## One Deletion

Remove the three consecutive FAILED runs from progress.md (lines 8-22) since they represent the same repeated error that this rule would prevent.

## Rationale

The smallest change is a single rule that forces the loop to check file existence upfront. This would have prevented 100% of observed failures with zero impact on successful runs.
