#!/usr/bin/env bash
# A stand-in for "a long task" — sleeps, then drops a done-marker file.
# Run this in one terminal, then start the watch loop in another (or the
# same Claude Code session, in the background) per the README.
set -euo pipefail
echo "Task started at $(date)"
sleep 180   # 3 minutes — long enough to prove the watcher didn't need you
echo "done at $(date)" > DONE.txt
echo "Task finished, wrote DONE.txt"
