# Loop Engineering Practices

Transferable skills from the Loop Engineering Crash Course.
Use as a checklist for every project.

---

## The Pattern (Repeat for Every Project)

1. Define "done" → What does success look like?
2. Create failing state → buggy code + failing tests
3. Write the loop script → heartbeat + checker + cap
4. Add the spine → progress.md (read first, update last)
5. Run it → bash fix-loop.sh
6. Verify it stopped right → "CONDITION MET" not "CAP HIT"
7. Document it → README.md + TESTING.md

---

## Practice 1: Define "Done" Before You Build

Write down what success looks like BEFORE writing code.

---

## Practice 2: The Checker Must Be a Real Command

A command cannot convince itself the work is fine — proof, not a claim.

Rule: The agent that writes the work must NOT approve it.

---

## Practice 3: The Spine Pattern (Read First, Update Last)

Every run reads memory at start, updates at end.

Rule: No spine = no loop.

---

## Practice 4: Cap Everything

Always set a limit — max tries, max minutes, or max spend.

---

## Practice 5: The Maker-Checker Split

One agent writes. A different agent or command grades.

---

## The Six Parts of a Loop

1. Heartbeat — starts each run
2. Worktree — isolation
3. Skill — project knowledge
4. Subagents — maker-checker split
5. Connector — reach real tools (MCP)
6. Spine — memory between runs

---

## Project Progress

| # | Project | Status | Key Learning |
|---|---------|--------|--------------|
| 1 | Watch Loop | Done | In-session loop |
| 2 | Make Tests Pass | Done | Conditional loop + maker-checker |
| 3 | Morning Brief with Memory | Done | Spine that remembers |
| 4 | Fix Loop with Real Checker | Done | Separate reviewer agent |
| 5 | Codify the Body | Done | Reusable script |
| 6 | The Doorbell Loop | Done | Event-driven + connectors |
| 7 | Break It on Purpose | Done | Observability + cost |
| 8 | Your Own Daily Loop | Done | Full 6-part loop |
| 9 | Rehearse a Routine | Done | One-off runs + A5 |
| 10 | The Secrets Drill | Done | Secrets in env vars |
| 11 | Two-Routine Gate | Done | Human gate |
| 12 | Dreaming Loop | Done | Meta-loop + improvement |
