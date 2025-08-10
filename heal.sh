#!/bin/bash

SERVICE=$1
LOG_FILE="/home/ritesh111/linux-monitor/logs/system_report.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Attempting to restart $SERVICE..." | tee -a "$LOG_FILE"
sudo /bin/systemctl restart "$SERVICE"

if systemctl is-active --quiet "$SERVICE"; then
    echo "[$DATE] $SERVICE restarted successfully." | tee -a "$LOG_FILE"
else
    echo "[$DATE] Failed to restart $SERVICE." | tee -a "$LOG_FILE"
    
fi

