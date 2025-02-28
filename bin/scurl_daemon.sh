#!/bin/bash
# Scurl background process (systemd daemon)

echo "Starting Scurl background service..."

# Ensure we're in the correct directory
cd /opt/scurl || exit 1

# Start scurl.sh in a way that systemd can track
while true; do
    /opt/scurl/bin/scurl.sh < /dev/null > /opt/scurl/scurl.log 2>&1
    echo "scurl.sh exited, restarting..."
    sleep 5  # Restart delay to prevent rapid crashes
done
