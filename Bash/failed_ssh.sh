#!/bin/bash
# Echos failed SSH attempts from /var/log/secure


LOG_FILE="/var/log/secure"
FAILED=$(grep -e 'ssh.*Failed' "${LOG_FILE}")

echo $FAILED
