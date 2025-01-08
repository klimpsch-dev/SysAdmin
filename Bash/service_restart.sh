#!/bin/bash

# Used to schedule service restarts with cronjob

# Specify the service name
SERVICE_NAME=""


sudo systemctl restart $SERVICE_NAME

# Output a message indicating the service was restarted
echo "$SERVICE_NAME has been restarted at $(date)" >> /var/log/service_restart.log