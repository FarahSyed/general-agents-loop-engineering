# Loop Engineering Crash Course — Projects Guide

## For Non-Technical People

### Project 1: The Watch Loop 👀

**What it is:** A helper that watches a long task and tells you when it's done.

**Real-life example:** Like putting a timer on your phone while cooking. You don't stand over the stove — the timer tells you when it's ready.

**Possibilities:**
- Watch a file download and notify you
- Monitor a backup process
- Check when a batch job finishes

---

### Project 2: The Test Loop ✅

**What it is:** A helper that keeps trying until something works, then stops.

**Real-life example:** Like a student retaking a test until they pass. They study, take the test, and stop when they pass — not after 6 tries regardless.

**Possibilities:**
- Fix code automatically until tests pass
- Retry a failed login until it works
- Keep applying until an application is accepted

---

### Project 3: The Morning Brief 🧠

**What it is:** A daily summary that remembers what it already told you.

**Real-life example:** Like a morning newspaper that only shows you new news, not yesterday's headlines again.

**Possibilities:**
- Daily summary of new emails
- Morning briefing on what changed in your projects
- Daily digest of new tasks or issues

---

### Project 4: The Fix Loop 🔍

**What it is:** One helper fixes bugs, another helper checks the work. Only good fixes get through.

**Real-life example:** Like a writer and an editor. The writer drafts, the editor reviews, and only polished articles get published.

**Possibilities:**
- Auto-fix code issues with quality control
- Generate content that gets reviewed before publishing
- Apply changes that must pass inspection

---

### Project 5: The Reusable Script 🧩

**What it is:** Take the fix-and-check process and turn it into a reusable script.

**Real-life example:** Like turning a recipe into a cookbook. Instead of cooking once from memory, you follow the same recipe every time.

**Possibilities:**
- Create templates for common tasks
- Build reusable workflows for your team
- Standardize processes that repeat

---

### Project 6: The Doorbell Loop 🔔

**What it is:** A helper that runs automatically when something happens (like a PR being created).

**Real-life example:** Like a doorbell — it rings when someone arrives, not on a schedule. You don't push a button; the event triggers it.

**Possibilities:**
- Auto-review code when someone submits it
- Send notifications when files change
- Run checks when new content is added

---

### Project 7: Break It on Purpose 🔦

**What it is:** Sabotage your own helper to learn how it fails.

**Real-life example:** Like a fire drill. You practice failing so you know what to do when it happens for real.

**Possibilities:**
- Learn what happens when things go wrong
- Practice diagnosing problems from logs
- Understand costs before they add up

---

### Project 8: The Daily Loop 🔁

**What it is:** A complete, unattended helper that runs daily on real work.

**Real-life example:** Like a cleaning service that comes every day. You trust them because you've watched them work, not because you stopped checking.

**Possibilities:**
- Daily code quality checks
- Automated reporting
- Routine maintenance tasks

---

### Project 9: Rehearse for Free 🧪

**What it is:** Test a routine once before scheduling it permanently.

**Real-life example:** Like a dress rehearsal before opening night. You try it once to make sure it works.

**Possibilities:**
- Test automation before committing
- Verify prompts work as expected
- Catch issues before they become routine

---

### Project 10: The Secrets Drill 🔑

**What it is:** Learn where passwords and API keys should live (and where they shouldn't).

**Real-life example:** Like learning not to leave your house key under the doormat. The key works, but it's in the wrong place.

**Possibilities:**
- Understand security best practices
- Protect sensitive information
- Avoid common security mistakes

---

### Project 11: The Two-Routine Gate 🚪

**What it is:** One helper drafts, you approve, another helper executes. You're the gatekeeper.

**Real-life example:** Like a purchase order system. Someone requests, you approve, then procurement buys.

**Possibilities:**
- Approval workflows
- Human-in-the-loop automation
- Controlled execution with oversight

---

### Project 12: The Dreaming Loop 🌙

**What it is:** A helper that reads other helpers' logs and suggests improvements.

**Real-life example:** Like a quality manager who reviews all reports and suggests process changes.

**Possibilities:**
- Self-improving systems
- Automated optimization
- Learning from past mistakes

---

## Summary (Non-Technical)

| Project | Non-Technical Analogy |
|---------|----------------------|
| 1 | Timer on your phone |
| 2 | Student retaking tests |
| 3 | Morning newspaper (no repeats) |
| 4 | Writer + Editor team |
| 5 | Cookbook from recipes |
| 6 | Doorbell (event-triggered) |
| 7 | Fire drill |
| 8 | Daily cleaning service |
| 9 | Dress rehearsal |
| 10 | Not hiding key under doormat |
| 11 | Purchase order system |
| 12 | Quality manager reviewing reports |

---

## For Technical People

### Project 1: The Watch Loop 👀

**What it is:** In-session polling loop that monitors a long-running process and reports completion.

**Technical implementation:**
- Shell script with `while` loop checking file/process existence
- `sleep` interval for polling
- Notification on condition met

**Possibilities:**
- Monitor async job completion (builds, deployments, data processing)
- Watch for file creation/modification in distributed systems
- Poll health checks until service is ready
- Monitor batch processing pipelines

---

### Project 2: The Test Loop ✅

**What it is:** Conditional loop with a real checker — the test runner determines exit, not the agent.

**Technical implementation:**
- `npm test` or `jest` as the condition
- Exit code 0 = success, non-zero = continue
- Cap at N retries to prevent infinite loops

**Possibilities:**
- Auto-fix lint errors until clean
- Retry flaky tests with exponential backoff
- Fix type errors until TypeScript compiles
- Resolve dependency conflicts automatically

---

### Project 3: The Morning Brief 🧠

**What it is:** Scheduled loop with a spine (progress.md) that maintains state between runs.

**Technical implementation:**
- `cron` or GitHub Actions schedule
- `progress.md` as persistent state
- Diff-based detection (new vs. known items)

**Possibilities:**
- Daily changelog generation
- Automated dependency audit reports
- Security vulnerability scanning
- Documentation freshness checks
- Cost monitoring dashboards

---

### Project 4: The Fix Loop 🔍

**What it is:** Maker-checker pattern with separate worktrees for isolation.

**Technical implementation:**
- `git worktree` or branch per candidate
- Separate agent for implementation vs. review
- PASS/FAIL verdict with PR creation on success

**Possibilities:**
- Automated code review with quality gates
- Multi-candidate optimization (try 3 approaches, pick best)
- Security patch application with verification
- Performance optimization with benchmark validation

---

### Project 5: The Reusable Script 🧩

**What it is:** Codified orchestration — turn the loop into a reusable script, prove it's an engine (no memory), identify what makes it a loop.

**Technical implementation:**
- `for` loop over candidates
- `&`/`wait` for parallel execution
- Reviewer exit code as checker
- Progress file as spine

**Possibilities:**
- CI/CD pipeline components
- Reusable automation scripts
- Template for multi-step workflows
- Foundation for more complex loops

---

### Project 6: The Doorbell Loop 🔔

**What it is:** Event-driven loop triggered by GitHub PR events via webhook.

**Technical implementation:**
- GitHub Actions workflow with `pull_request` trigger
- `anomalyco/opencode/github@latest` action
- OPENCODE_API_KEY in secrets
- `synchronize` event for re-fires

**Possibilities:**
- Automated PR review on every push
- Security scanning on code changes
- Documentation generation on merge
- Deployment triggers on approval
- Issue triage on creation

---

### Project 7: Break It on Purpose 🔦

**What it is:** Chaos engineering for loops — intentional failure injection to test observability.

**Technical implementation:**
- Point prompt at nonexistent file
- Set impossible success conditions
- Measure tokens × cadence = monthly cost
- Diagnose from spine alone (no replay)

**Possibilities:**
- Cost optimization before production
- Failure mode documentation
- Alert threshold calibration
- Runbook validation

---

### Project 8: The Daily Loop 🔁

**What it is:** Full 6-part loop (heartbeat, worktree, skill, maker-checker, connector, spine) on real work.

**Technical implementation:**
- Cron schedule (daily at 9 AM)
- Fresh clone per run (isolation)
- Skill with project-specific knowledge
- Budget guards (max tokens, runtime, files)
- Git commit as connector

**Possibilities:**
- Daily lint sweeps with auto-fix
- Dependency update PRs
- Documentation freshness checks
- Security audit automation
- Performance regression detection

---

### Project 9: Rehearse a Routine for Free 🧪

**What it is:** One-off runs to validate prompts before committing to schedule.

**Technical implementation:**
- `/schedule now` or `Run now` in Claude.ai
- Read full transcript (not status column)
- A5 lesson: green ≠ success

**Possibilities:**
- Prompt engineering validation
- Cost estimation before scheduling
- Failure mode discovery
- Edge case identification

---

### Project 10: The Secrets Drill 🔑

**What it is:** Understanding where secrets live in cloud environments.

**Technical implementation:**
- `.env` is gitignored → never reaches GitHub
- Environment variables panel in routine config
- Prompt must say: "credentials are available as environment variables"

**Possibilities:**
- Secure secret management
- Avoiding accidental exposure
- Understanding cloud vs. local environments
- Compliance with security policies

---

### Project 11: The Two-Routine Gate 🚪

**What it is:** Human-in-the-loop pattern with API trigger for execution.

**Technical implementation:**
- Routine A: drafts on one-off schedule
- Routine B: API trigger with bearer token
- Manual review → curl to fire B
- A6 checklist (connectors pruned, unrestricted pushes off)

**Possibilities:**
- Approval workflows for deployments
- Human oversight for automated decisions
- Controlled release processes
- Audit trails for compliance

---

### Project 12: The Dreaming Loop 🌙

**What it is:** Meta-loop that reads other loops' logs and proposes rule changes as PRs.

**Technical implementation:**
- Weekly schedule
- Reads `progress.md` from other loops
- Finds repeated failures (pattern detection)
- Drafts smallest fix as PR on `claude/` branch
- Updates `dreaming-state.md` with last processed date

**Possibilities:**
- Self-improving automation
- Automated runbook updates
- Failure pattern detection
- Cost optimization recommendations
- Rule refinement based on actual usage

---

## Summary (Technical)

| # | Pattern | Technical Concept |
|---|---------|-------------------|
| 1 | Polling | In-session loop |
| 2 | Retry | Conditional exit |
| 3 | Scheduled | Spine pattern |
| 4 | Parallel | Maker-checker split |
| 5 | Codified | Engine vs. loop distinction |
| 6 | Event-driven | Webhook triggers |
| 7 | Chaos | Observability + cost |
| 8 | Full loop | All 6 parts integrated |
| 9 | Validation | One-off testing |
| 10 | Security | Secret management |
| 11 | Gate | Human-in-the-loop |
| 12 | Meta-loop | Self-improvement |

---

## Production Applications

| Use Case | Projects Used |
|----------|---------------|
| CI/CD pipeline | 2, 4, 5, 6 |
| Security automation | 6, 7, 10 |
| Cost optimization | 7, 8, 12 |
| Self-healing systems | 2, 4, 12 |
| Compliance workflows | 6, 11 |
| Documentation automation | 3, 8, 12 |
