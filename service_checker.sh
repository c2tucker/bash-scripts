#!/bin/bash

#Purpose: Check the status of critical system services
#Date: 6/22/2026
#Usage: ./service_checker.sh

SERVICES=("ssh" "cron" "ufw")

echo "===================="
echo "  SERVICE STATUS REPORT"
echo "  $(date)"
echo "===================="
echo ""

for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "  [RUNNING]  $SERVICE"
    else
	echo "  [STOPPED]  $SERVICE"
    fi
done

echo ""
echo "===================="
echo "  END OF REPORT"
echo "===================="
