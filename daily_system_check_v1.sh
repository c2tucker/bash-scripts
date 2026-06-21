#!/bin/bash

# Purpose: Daily System Check
# Date: 6/21/2026
# Modification: First version of useful script
# More comments

echo "==============================="
echo "  SYSTEM REPORT"
echo "  $(date)"
echo "==============================="

echo ""
echo "--- HOSTNAME ---"
hostname


echo ""
echo "--- DISK USAGE ---"
df -h /


echo ""
echo "--- MEMORY USAGE ---"
free -h


echo ""
echo "--- LOGGED IN USERS ---"
who

echo ""
echo "==============================="
echo "  END OF REPORT"
echo "==============================="

DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK" -gt 80 ]; then
   echo "WARNING: Disk usage is at ${DISK}% - Take action!"
else
   echo "Disk usage is at ${DISK}% - All good!"
fi
