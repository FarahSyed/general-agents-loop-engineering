# Progress — Project 4: Fix Loop with Real Checker

## Goal
A loop where:
- An implementer drafts a fix using a skill
- A SEPARATE reviewer agent grades it (PASS/FAIL)
- Only PASS opens a branch (no PR yet — human gate)

## The Bug
`divide(10, 2)` returns `20` (multiplication) instead of `5` (division).

## Attempts

<!-- Each run appends here -->

## Run: 2026-08-21 22:27:00
- **Bug:** divide() returns wrong result
- **Cap:** 4 tries

- **Beat 1:** Maker fixed divide() — changed `a * b` to `a / b`
- **Beat 1:** Reviewer ran npm test, checked the fix → **PASS**
- **Reviewer output:** "The fix is correct. All 4 tests pass."
- **Result:** SUCCESS — fix verified by reviewer

## Run: 2026-08-21 22:30:00
- **Test:** Deliberately bad fix (removed divide-by-zero check)
- **Cap:** 4 tries

- **Beat 1:** Planted bad fix — removed divide-by-zero check
- **Beat 1:** Reviewer ran npm test, caught the missing check → **FAIL**
- **Reviewer output:** "Divide-by-zero check is missing. 1 test failed."
- **Result:** SUCCESS — reviewer correctly caught the bad fix

## Verification Complete
- ✅ Good fix gets PASS
- ✅ Bad fix gets FAIL with reasons
- ✅ Reviewer is not too soft — it catches real problems
