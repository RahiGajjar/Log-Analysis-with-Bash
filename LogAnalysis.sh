#!/bin/bash

LOG_FILE="/var/log/auth.log"
OUTPUT_FILE="log_analysis.txt"


if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found: $LOG_FILE"
    exit 1
fi

# Start writing to the output file
echo "===== LOG ANALYSIS REPORT =====" > "$OUTPUT_FILE"
echo "Date: $(date)" >> "$OUTPUT_FILE"
echo "===============================" >> "$OUTPUT_FILE"

echo -e "\nFailed SSH login attempts:" | tee -a "$OUTPUT_FILE"
grep "Failed password" "$LOG_FILE" | awk '{print $11}' | sort | uniq -c | sort -nr | tee -a "$OUTPU>

# Count successful SSH logins
echo -e "\nSuccessful SSH logins:" | tee -a "$OUTPUT_FILE"
grep "Accepted password" "$LOG_FILE" | awk '{print $9}' | sort | uniq -c | sort -nr | tee -a "$OUTP>

# Identify repeated attacks from the same IP
echo -e "\nTop 5 attacking IPs:" | tee -a "$OUTPUT_FILE"
grep "Failed password" "$LOG_FILE" | awk '{print $11}' | sort | uniq -c | sort -nr | head -5 | tee >

echo -e "\nRoot login attempts:" | tee -a "$OUTPUT_FILE"
grep "Failed password.*root" "$LOG_FILE" | tee -a "$OUTPUT_FILE"

# List all users who attempted to log in
echo -e "\nUsers who attempted to log in:" | tee -a "$OUTPUT_FILE"
grep "Failed password" "$LOG_FILE" | awk '{print $9}' | sort | uniq | tee -a "$OUTPUT_FILE"

echo -e "\nLog analysis completed. Results saved to: $OUTPUT_FILE"
