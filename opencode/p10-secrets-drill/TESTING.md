# Project 10: Testing Guide — Secrets Drill

## Prerequisites

- A git repository
- GitHub repository with environment variables panel

## Step 1: Create a Dummy Token

```bash
echo "API_TOKEN=dummy-token-12345" > .env
```

Make sure `.env` is in `.gitignore`:

```bash
echo ".env" >> .gitignore
git add .gitignore
git commit -m "Add .gitignore"
```

## Step 2: First Run (Failure)

### Claude Code CLI

```bash
/schedule now, read the API_TOKEN from the environment and print it
```

### Claude.ai

1. Create routine
2. Prompt: "Read the API_TOKEN from the environment and print it"
3. Do NOT add the environment variable yet
4. Run it

**What happens?**
- Claude tries to read `.env` file
- File not found (gitignored, not in clone)
- Claude improvises or fails

Read the transcript. What did Claude try?

## Step 3: Second Run (Success)

1. Go to your repo Settings → Secrets → Actions
2. Add `API_TOKEN` = `dummy-token-12345`
3. Update the routine prompt:

```
Credentials are available as environment variables; do not look for a .env file.
Read the API_TOKEN from the environment and print it.
```

4. Run it again

**What happens?**
- Claude reads from environment
- Token found
- Success

## Step 4: Answer

**Why couldn't the first run find the token?**

The mechanical reason:
1. `.env` is in `.gitignore`
2. `.gitignore` files are not pushed to GitHub
3. When the routine runs, it creates a fresh clone
4. The fresh clone does not contain `.env`
5. Claude tries to read `.env` → file not found

**The rule:** Secrets go in environment variables, never in `.env` files.

## Commands

```bash
# Check if .env is gitignored
git check-ignore .env

# List environment variables in GitHub
# Go to: Settings → Secrets → Actions
```
