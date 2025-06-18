#!/bin/bash

# Setup CRON job for Task Scheduler
# This script will configure the system to run cron.php every hour

# Get absolute path to cron.php
CRON_PHP_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/cron.php"

# Verify cron.php exists
if [ ! -f "$CRON_PHP_PATH" ]; then
    echo "Error: cron.php not found at $CRON_PHP_PATH"
    exit 1
fi

# Find PHP executable 
PHP_PATH=$(command -v php)
if [ -z "$PHP_PATH" ]; then
    echo "Error: PHP executable not found in PATH"
    exit 1
fi

# CRON job command (runs at minute 0 of every hour)
CRON_JOB="0 * * * * $PHP_PATH $CRON_PHP_PATH >/dev/null 2>&1"

# Check if the job already exists in crontab
EXISTING_JOB=$(crontab -l 2>/dev/null | grep -F "$CRON_PHP_PATH")

if [ -z "$EXISTING_JOB" ]; then
    # Add the job to crontab
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    if [ $? -eq 0 ]; then
        echo "Successfully installed CRON job:"
        echo "$CRON_JOB"
    else
        echo "Error: Failed to install CRON job"
        exit 1
    fi
else
    echo "CRON job already exists:"
    echo "$EXISTING_JOB"
fi

# Ensure cron.php is executable
chmod +x "$CRON_PHP_PATH"

echo "Task Scheduler CRON setup complete. Reminders will run hourly."
