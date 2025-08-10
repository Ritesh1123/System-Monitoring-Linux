#!/bin/bash

LOG_FILE="/home/ritesh111/linux-monitor/logs/system_report.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
USER=ritesh111

# === Define log paths ===
LOG_DIR="/home/ritesh111/linux-monitor/logs"
MAIN_LOG="$LOG_DIR/system_report.log"
CRON_LOG="$LOG_DIR/cron.log"

# === Set log size limit (10KB) ===
MAX_SIZE=10240  # 10 KB in bytes

# === Function to rotate if log > 10KB ===
rotate_log_if_needed() {
    local FILE=$1
    if [ -f "$FILE" ]; then
        SIZE=$(stat -c%s "$FILE")
        if [ "$SIZE" -gt "$MAX_SIZE" ]; then
            echo "[$DATE] Log file '$FILE' exceeded 10KB. Rotating..." > "$FILE"
        fi
    fi
}

# === Rotate both logs if needed ===
rotate_log_if_needed "$MAIN_LOG"
rotate_log_if_needed "$CRON_LOG"

echo "----- System Report at $DATE -----" | tee -a $LOG_FILE

# CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $CPU%" | tee -a $LOG_FILE

# Memory Usage
MEM=$(free -m | awk '/Mem/ { printf("%.2f"), $3/$2*100 }')
echo "Memory Usage: $MEM%" | tee -a $LOG_FILE

# Disk Usage
DISK=$(df -h / | grep / | awk '{print $5}' | sed 's/%//')
echo "Disk Usage: $DISK%" | tee -a $LOG_FILE

# Battery Level
if command -v acpi >/dev/null; then
    BATTERY=$(acpi -b | awk '{print $4}' | sed 's/,//')
    echo "Battery Level: $BATTERY" | tee -a "$LOG_FILE"
else
    echo "Battery info not available (acpi not installed)" | tee -a "$LOG_FILE"
fi

# ⚠️ High Resource Alerts (Thresholds)
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

if (( $(echo "$CPU > $CPU_THRESHOLD" | bc -l) )); then
    ALERT="High CPU Usage: $CPU%"
    echo "⚠️ $ALERT" | tee -a $LOG_FILE
fi

if (( $(echo "$MEM > $MEM_THRESHOLD" | bc -l) )); then
    ALERT="High Memory Usage: $MEM%"
    echo "⚠️ $ALERT" | tee -a $LOG_FILE
fi

if (( DISK > DISK_THRESHOLD )); then
    ALERT="High Disk Usage: $DISK%"
    echo "⚠️ $ALERT" | tee -a $LOG_FILE

fi

# Check sshd Service
SERVICE="ssh"
if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE is running" | tee -a $LOG_FILE
else
    echo "$SERVICE is NOT running" | tee -a $LOG_FILE
    bash heal.sh $SERVICE | tee -a $LOG_FILE
fi

echo "--------------------------------------" | tee -a $LOG_FILE


