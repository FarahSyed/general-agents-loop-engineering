# Project 6: Testing Guide — The Doorbell Loop

## Prerequisites

1. GitHub account
2. ANTHROPIC_API_KEY
3. opencode installed with `opencode github install`

## Setup Steps

### 1. Create the repo on GitHub
```bash
# In p6-doorbell directory
git init
git remote add origin https://github.com/YOUR_USERNAME/p6-doorbell.git
```

### 2. Add the secret
- Go to: https://github.com/YOUR_USERNAME/p6-doorbell/settings/secrets/actions
- Click "New repository secret"
- Name: `ANTHROPIC_API_KEY`
- Value: your API key

### 3. Install opencode GitHub app
```bash
opencode github install
```

### 4. Push the code
```bash
git add .
git commit -m "Initial commit"
git push -u origin main
```

## Test the Doorbell

### 1. Create a branch with a bug
```bash
git checkout -b fix/auth-bug
```

### 2. Plant the bug (if not already there)
The bug is in `src/auth.js`:
```javascript
// BUG: Off-by-one error
if (password.length > 8) {  // Should be >= 8
  return true;
}
```

### 3. Commit and push
```bash
git add .
git commit -m "Fix password validation"
git push -u origin fix/auth-bug
```

### 4. Create the PR
- Go to: https://github.com/YOUR_USERNAME/p6-doorbell
- Click "Compare & pull request"
- Create the PR

### 5. Wait for the review
- Wait 1-2 minutes
- Check the PR for a review comment
- The review should flag the off-by-one bug

## What to Look For

### If the review catches the bug:
✅ **PASS** — The doorbell works!

### If the review misses the bug:
1. Read the review
2. Tighten the prompt in `.github/workflows/opencode.yml`
3. Push again (this fires the synchronize event)
4. Wait for a new review

## Commands

```bash
# Initialize repo
git init
git remote add origin https://github.com/YOUR_USERNAME/p6-doorbell.git

# Create branch with bug
git checkout -b fix/auth-bug

# Push and create PR
git push -u origin fix/auth-bug

# Install opencode GitHub app
opencode github install
```
