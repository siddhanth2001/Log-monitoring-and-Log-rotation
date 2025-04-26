#!/bin/bash

LOGFILE="/var/log/system.log"     # This is like your Mac's diary
ROTATE_DIR="$HOME/log-analyzer/rotated"
MAXSIZE=5000000                   # 5MB
REPORT="$HOME/log-analyzer/log_report.txt"

mkdir -p "$ROTATE_DIR"            # Make rotated folder if missing

echo "=== $(date) ===" > "$REPORT"
echo "Checking $LOGFILE for errors and warnings..." >> "$REPORT"

# Look for messages like “error” or “warning”
grep -Ei "error|warn" "$LOGFILE" >> "$REPORT"

# If the file is too big, move it
SIZE=$(stat -f%z "$LOGFILE")
if [ "$SIZE" -gt "$MAXSIZE" ]; then
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    mv "$LOGFILE" "$ROTATE_DIR/system_$TIMESTAMP.log"
    sudo touch "$LOGFILE"
    echo "Log was too big. Rotated it!" >> "$REPORT"
else
    echo "Log size is OK ($SIZE bytes)." >> "$REPORT"
fi

cat "$REPORT"

