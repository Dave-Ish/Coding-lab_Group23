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

secure_data() {
    chmod 700 active_logs
    echo "Active logs permissions secured:"
    ls -ld active_logs
}

# Execute the system setup
initialize_system
secure_data

echo "System Environment Secured"
echo "Date: $(date)"
