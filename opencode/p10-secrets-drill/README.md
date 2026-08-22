# Project 10: The Secrets Drill

> Fail the .env way once, on purpose, so you never do it by accident.

## What You Learn

- **A4**: Secrets go in environment variables, not .env files
- **A2**: The environment panel

## The Idea

Fail on purpose by putting a secret in .env (which gets gitignored). See Claude try to find it and fail. Then fix it by using environment variables.

## Files

| File | Purpose |
|------|---------|
| `progress.md` | The spine |
| `README.md` | This file |
| `TESTING.md` | How to test |

## The Mechanical Reason

`.env` is gitignored → gitignored files never reach GitHub → fresh cloud clone never contains them → routine finds nothing.

## Steps

### Step 1: Write a Prompt That Needs a Secret

```
Read the API token from the environment and print "Token found: <token>"
```

### Step 2: First Run (Failure)

1. Put token in `.env` file:
   ```
   API_TOKEN=dummy-token-12345
   ```
2. Make sure `.env` is in `.gitignore`
3. Fire the routine
4. Watch it fail
5. Read transcript to see what Claude tried

### Step 3: Second Run (Success)

1. Move token to environment variables panel
2. Add to prompt: "credentials are available as environment variables; do not look for a `.env` file."
3. Fire the routine
4. Watch it succeed

### Step 4: Answer

Why couldn't the first run find the token?

**Answer:** Gitignored files never reach GitHub, so the fresh cloud clone never contains them.

## "Done" Checklist

- [ ] First run failed (token in .env)
- [ ] Second run succeeded (token in environment)
- [ ] You can explain the mechanical reason
