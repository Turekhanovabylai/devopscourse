#!/bin/bash

SOURCE_DIRS=("dir1" "dir2" "dir3")
mkdir -p dir1
mkdir -p dir2
mkdir -p dir3

BACKUP_DIR="backups"
mkdir -p "$BACKUP_DIR"

DATE=$(date +"%Y-%m-%d")

for DIR in "${SOURCE_DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    ARCHIVE_NAME="${BACKUP_DIR}/backup_${DIR}_${DATE}.tar.gz"
    tar -czvf "$ARCHIVE_NAME" "$DIR"
  fi
done

SCRIPT_PATH="$(pwd)/$(basename "$0")"
CRON_JOB="0 2 * * 0 $SCRIPT_PATH"
(crontab -l | grep -F "$CRON_JOB" > /dev/null) || (crontab -l; echo "$CRON_JOB") | crontab -

