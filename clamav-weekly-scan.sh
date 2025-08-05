#!/bin/bash

# Paths to scan
SCAN_DIRS="$HOME/Downloads $HOME/Documents"

# Log file
LOG_FILE="$HOME/clamav_scan_$(date +%F).log"

# Make sure virus definitions are updated
echo "🔄 Updating ClamAV definitions..."
sudo freshclam

# Run scan
echo "🛡️ Starting scan in $SCAN_DIRS..."
clamscan -r --bell -i $SCAN_DIRS | tee "$LOG_FILE"

# Notify if threats found
if grep -q "Infected files: 0" "$LOG_FILE"; then
    echo "✅ No threats found."
else
    echo "⚠️ Threats found! See log: $LOG_FILE"
    # Optional: Send desktop notification
    notify-send "ClamAV Scan" "Threats found! Check: $LOG_FILE"
fi
