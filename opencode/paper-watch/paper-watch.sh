#!/bin/bash
# Paper Watch - run once
# Usage: ./paper-watch.sh [topic]
# Example: ./paper-watch.sh "diffusion models"

TOPIC=${1:-"LLM agents"}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📄  Paper Watch — ${TOPIC}"
echo ""
cd "$SCRIPT_DIR" && PYTHONIOENCODING=utf-8 python3 paperwatch.py --topic "$TOPIC"
