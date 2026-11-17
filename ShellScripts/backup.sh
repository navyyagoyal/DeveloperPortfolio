#!/bin/bash
# Author: Navya
if [ -z "$1" ]; then
  echo "Usage: ./backup.sh <folder>"
  exit 1
fi
if [ ! -d "$1" ]; then
  echo "Error: folder '$1' does not exist."
  exit 1
fi
BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"
TS=$(date +%Y-%m-%d_%H-%M-%S)
FILE="backup_$TS.tar.gz"
if tar -czf "$BACKUP_DIR/$FILE" -C "$(dirname "$1")" "$(basename "$1")"; then
  SIZE=$(du -h "$BACKUP_DIR/$FILE" | awk '{print $1}')
  echo "Backup successful: $FILE ($SIZE)"
  echo "$TS - SUCCESS - $FILE ($SIZE)" >> "$BACKUP_DIR/backup.log"
else
  echo "Backup failed"
  echo "$TS - FAILED - $1" >> "$BACKUP_DIR/backup.log"
  exit 1
fi
