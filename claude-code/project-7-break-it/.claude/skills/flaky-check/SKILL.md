---
name: flaky-check
description: Read progress.md, check for a file that this project deliberately does not have, and report. Used to rehearse an overnight loop failure on purpose.
---

# flaky-check

1. Read `progress.md` first.
2. Read `does-not-exist.txt` (this file is deliberately absent — see the
   project README).
3. Summarize what you found and append a dated entry to `progress.md`,
   including whether this run needs a human.
