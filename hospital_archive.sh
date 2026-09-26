#!/bin/bash

#  David: Log rotation script

echo "Log rotation engine initialized...."

# 1.  defined the currrent timestamp (formart: year,month,day, hour, min,)
TIMESTAMP=$(date +"%Y%m%d_%H%M")

# 2.  defnined the log arrays

LOG_FILES=("heart_rate_log.log" "temperature_log.log" "water_log.log")

# . Checking weather the destination dir  not missing

if [ ! -d "archived_logs" ]; then
echo "Creating missing archived_logs directory..."
mkdir -p archived_logs

fi

echo "Starting fresh log migration ..."
# 4. Processing each log file sequentially
	#
for log in "${LOG_FILES[@]}"; do

	ACTIVE_PATH="active_logs/$log"

	if [ -f "ACTIVE_PATH" ] then
		# I passed a  prefix name( e.g., hear_rate) removing the  _log.log
		BASE_NAME=$(basename "$log" _log.log)
		ARCHIVE_NAME="${BASE_NAME}_&{TIMESTAMP}.log"
		
		#Execute the move (overwrites existing matching destination paths)
		mv "$ACTIVE_PATH" "archived_logs/$ARCHIVE_NAME"
		echo "Successfully archived: $log -> $ARCHIVE_NAME"

		#Sytem continuity: instantly reintitialize empty tracking tamplate
		
		touch "$ACTIVE_PATH"
	else
		echo "Notice: Active log file $log not found. Re-instanitating empty tream baseline."
		touch "$CTIVE_PATH"
	fi
done

echo "log rotation procedure completed, successfully!!!!!!!"	
