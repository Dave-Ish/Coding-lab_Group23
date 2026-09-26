#!/bin/bash

process_vitals() {
grep -h "CRITICAL" active_logs/heart_rate_log.log active_logs/temperature_log.log | awk -F'|' '{print $1, $2, $3}' > reports/critical_alerts.txt
}

process_vitals
