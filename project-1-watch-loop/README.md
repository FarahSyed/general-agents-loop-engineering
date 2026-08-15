# Project 1 — A watch loop

**Difficulty:** easy · **Uses:** Concept 4, in-session loop · **Time:** 15-30 min

## Goal

Make a loop watch a long-running task and tell you the moment it finishes,
without you babysitting the terminal.

## Build

1. Start the long task in the background:

   ```bash
   cd project-1-watch-loop
   ./long-task.sh &
   ```

2. In your Claude Code session (in this same folder), start an in-session
   loop:

   ```text
   /loop 1m check if DONE.txt exists in this folder; if it does, read it,
   tell me the task finished and what it said, then cancel this loop
   yourself
   ```

3. Go do something else. Do not watch the terminal.

4. When it fires and tells you, confirm it actually stopped:

   ```text
   show my running loops
   ```

   It should be gone (you told it to cancel itself on success — this is
   the loop's own success condition, not you clicking stop).

## Done when

- The loop notices `DONE.txt`, tells you once, and cancels itself cleanly.
- You never sat watching the terminal.

## What this proves

`/loop` keeps its own timer *inside your open session*. Close the terminal
before it fires and the watching dies — that's not a bug, it's the
definition of an in-session heartbeat (Concept 4). It's the right tool for
"watch this while I'm still around," and the wrong tool for anything that
must survive a closed laptop — that's Project 3 and 6.
