#!/usr/bin/env bash
# The in-session watch loop (Concept 4), fixed.
# HEARTBEAT: the shell `while` + `sleep` (fires a beat every 20s).
# BEAT:      one `opencode run` that reports the current state in plain language.
# CHECKER:   a REAL command (`test -f DONE.txt`) decides "done" — never the
#            model's reply, because the transcript always contains "DONE.txt".
while true; do
  if test -f DONE.txt; then
    echo "[$(date +%T)] CHECKER: DONE.txt found — the task finished. Stopping the watch."
    break
  fi
  opencode run "Report the current state of the long task in one short line."
  echo "[$(date +%T)] beat fired, not finished yet — waiting"
  sleep 20
done