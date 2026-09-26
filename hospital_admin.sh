#!/bin/bash

#Create the required hospital directories if they do not exist

initialize_system() {
for directory in active_logs archived_logs reports
do
if [ ! -d "$directory" ]; then
echo "Creating $directory directory.."
mkdir "$directory"

else
echo "$directory already exists."
fi
done
}

initialize_system

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
