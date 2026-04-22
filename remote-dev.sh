#!/bin/bash
# Configuration
REMOTE="vp-login-2"
SESSION="main"
ZELLIJ="/mnt/pi-home/home/kevinblack/.local/bin/zellij"

# Optimize SSH for speed:
# - ControlMaster reuses the existing connection (instant reconnect)
# - ConnectTimeout prevents long hangs if the network is totally gone
SSH_OPTS="-o ControlMaster=auto -o ControlPath=~/.ssh/mux-%r@%h:%p -o ControlPersist=10m -o ConnectTimeout=5 -o ServerAliveInterval=10 -o ServerAliveCountMax=2"

while true; do
    clear
    echo "⚡ Connecting to Zellij ($REMOTE:$SESSION)..."

    # Connect and attach
    ssh -t $SSH_OPTS $REMOTE "$ZELLIJ attach --create $SESSION"

    # If we get here, the connection died
    echo -e "\n--- Connection Lost or Closed ---"
    echo -e "\n--- Retrying in 3 seconds...  ---"
    sleep 3
done
