#!/bin/bash

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
