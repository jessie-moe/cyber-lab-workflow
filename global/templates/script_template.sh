#!/bin/bash
# ============================================================================
# SCRIPT TEMPLATE
# Author: Jessie Moe
# Date: $(date +%Y-%m-%d)
# Description: [Describe what this script automates]
# ============================================================================

LOGFILE="/var/log/script_activity.log"

echo "[+] Starting script execution at $(date)" | tee -a "$LOGFILE"

# Example structure
function main() {
    echo "[+] Performing main task..." | tee -a "$LOGFILE"
    # Commands go here
}

# Run main function
main

echo "[+] Script completed successfully at $(date)" | tee -a "$LOGFILE"
exit 0
