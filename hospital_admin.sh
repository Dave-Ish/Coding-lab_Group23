#!/bin/bash
# Locks active_logs to owner-only access per KNH data policy
secure_data() {
    echo "Securing active_logs directory..."
    chmod 700 active_logs
    if [ -n "$(ls -A active_logs 2>/dev/null)" ]; then
    chmod 600 active_logs/*
fi
    echo "Permissions updated. Current status:"
    ls -ld active_logs
    ls -l active_logs
}
