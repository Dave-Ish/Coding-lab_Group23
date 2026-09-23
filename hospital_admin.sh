#!/bin/bash

secure_data() {
    echo "Securing active_logs directory..."
    chmod 700 active_logs
    chmod 600 active_logs/*
    echo "Permissions updated. Current status:"
    ls -ld active_logs
    ls -l active_logs
}
