#!/usr/bin/env bash
# The "long task" we want to watch but not babysit.
# Stand-in for a deploy, a long test run, or a CI job.
echo "long task started at $(date +%T)"
sleep 60
echo "DONE - the deploy finished at $(date +%T)" > DONE.txt
echo "long task finished, wrote DONE.txt"