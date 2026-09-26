#!/bin/bash

process_vitals() {
grep -h "CRITICAL" active_logs/heart_rate_log.log active_logs/temperature_log.log | awk -F'|' '{print $1, $2, $3}' > reports/critical_alerts.txt
}

water_audit() {
if [ ! -f active_logs/water_usage_log.log ]; then echo "water_usage_log.log not found"; return 1; fi
    awk -F'|' '
    {
        gsub(/^[ \t]+|[ \t]+$/, "", $2)
        gsub(/^[ \t]+|[ \t]+$/, "", $3)
        if ($2 == "ICU_WATER_RESERVE") {
            sum += $3
            count++
        }
    }
    END {
        if (count > 0) {
            avg = sum / count
            printf "ICU Water Reserve - Average Usage: %.2f Liters/min (%d readings)\n", avg, count
        } else {
            printf "No ICU_WATER_RESERVE readings found.\n"
        }
    }' active_logs/water_usage_log.log
# Calculates average water usage for ICU_WATER_RESERVE device and prints summary
}
process_vitals
water_audit


