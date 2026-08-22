#!/bin/bash
# Project 7: Break It on Purpose
# This script sabotages the morning brief loop

echo "=== Project 7: Sabotage Menu ==="
echo ""
echo "Choose a sabotage method:"
echo "1) Point at a file that doesn't exist"
echo "2) Give it an impossible success condition"
echo "3) Trim the prompt to one sentence"
echo ""
read -p "Enter choice (1-3): " choice

case $choice in
  1)
    echo ""
    echo "=== Sabotage: Missing File ==="
    echo "Editing morning-brief.sh to read from nonexistent.txt..."
    
    # Backup original
    cp morning-brief.sh morning-brief.sh.bak
    
    # Sabotage: point to nonexistent file
    sed -i 's|TODO_FILES=$(grep -r "TODO" src/ --include="*.js" -l)|TODO_FILES=$(grep -r "TODO" nonexistent/ --include="*.js" -l)|' morning-brief.sh
    
    echo "Done. Run 'bash morning-brief.sh' to see it fail."
    ;;
    
  2)
    echo ""
    echo "=== Sabotage: Impossible Condition ==="
    echo "Editing morning-brief.sh to require 100% completion..."
    
    # Backup original
    cp morning-brief.sh morning-brief.sh.bak
    
    # Sabotage: impossible condition
    echo '' >> morning-brief.sh
    echo '# SABOTAGE: Impossible success condition' >> morning-brief.sh
    echo 'if [ "$NEW_TODOS" -ne 100 ]; then' >> morning-brief.sh
    echo '  echo "FAIL: Expected 100 new TODOs, found $NEW_TODOS"' >> morning-brief.sh
    echo '  exit 1' >> morning-brief.sh
    echo 'fi' >> morning-brief.sh
    
    echo "Done. Run 'bash morning-brief.sh' to see it fail."
    ;;
    
  3)
    echo ""
    echo "=== Sabotage: Trim Prompt ==="
    echo "Editing morning-brief.sh to use minimal prompt..."
    
    # Backup original
    cp morning-brief.sh morning-brief.sh.bak
    
    # Sabotage: trim prompt
    sed -i 's|echo "Scan for TODO comments and update progress.md"|echo "Find TODOs"|' morning-brief.sh
    
    echo "Done. Run 'bash morning-brief.sh' to see degraded results."
    ;;
    
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

echo ""
echo "=== Next Steps ==="
echo "1. Run: bash morning-brief.sh"
echo "2. Watch it fail"
echo "3. Read progress.md to diagnose"
echo "4. Write your field note"
