#!/bin/bash

LOG_FILE="/var/log/secure"
FAILED=$(grep -e 'ssh.*Failed' "${LOG_FILE}")

echo $FAILED
