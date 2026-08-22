# Project 6: The Doorbell Loop

> A loop that reacts to a pull request, with no prompt typed.

## What You Learn

- **Concept 7:** Event-driven heartbeat (PR triggers the loop)
- **Concept 10:** Connectors (GitHub integration)

## The Idea

Open a pull request with a planted bug. Wait. About a minute later, a review appears that you never asked for. The PR triggered the loop — that's the event-driven heartbeat.

## Files

| File | Purpose |
|------|---------|
| `src/auth.js` | Module with a planted off-by-one bug |
| `src/auth.test.js` | Tests for the auth module |
| `.github/workflows/opencode.yml` | GitHub Actions workflow |
| `progress.md` | The spine |

## Setup

### 1. Create a GitHub repo
```bash
git init
git remote add origin https://github.com/YOUR_USERNAME/p6-doorbell.git
```

### 2. Add ANTHROPIC_API_KEY as a secret
- Go to repo Settings → Secrets → Actions
- Add `ANTHROPIC_API_KEY` with your API key

### 3. Install the opencode GitHub app
```bash
opencode github install
```

### 4. Push the code
```bash
git add .
git commit -m "Initial commit"
git push -u origin main
```

## Run

### 1. Create a PR with a planted bug
```bash
git checkout -b fix/auth-bug
# Edit src/auth.js to add a bug (off-by-one: > 8 instead of >= 8)
git add .
git commit -m "Fix password validation"
git push -u origin fix/auth-bug
```

### 2. Wait for the review
- Go to your PR on GitHub
- Wait about 1 minute
- A review should appear automatically

### 3. Check the review
- Does it catch the off-by-one bug?
- If not, tighten the prompt and push again

## What "Done" Looks Like

- ✅ PR gets a review you never asked for
- ✅ Review flags the planted bug
- ✅ Pushing again fires another review (synchronize event)

## The Planted Bug

```javascript
// BUG: Off-by-one error
// Should be: password.length >= 8
// Actually is: password.length > 8
if (password.length > 8) {
  return true;
}
```

## Key Lesson

The PR is the **heartbeat**. No clock, no schedule — the event starts the loop. Zero times on a quiet day, nine times on a busy one.
