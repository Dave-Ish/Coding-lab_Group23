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

# secure directories and interioal files per KNH protocol

secure_data(){
echo "Securing active _logs directory..."
chmod 700 active_logs

# If the active_log directory contains files, lock them to 600 

if [ -n "$(ls -A active_logs 2>/dev/null)" ];
then
chmod 600 active_logs/*
fi
echo "Permisions updated. current status: "
ls -ld active_logs
ls -l active_logs
}

# Automotion core block
initialize_system
secure_data

echo "System Environment Secured"
echo "Date: $(date)"
