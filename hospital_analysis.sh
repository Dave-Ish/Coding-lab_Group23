water_audit() {
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
}
