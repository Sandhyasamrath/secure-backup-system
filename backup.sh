#!/bin/bash

SOURCE_DIR="$HOME/Documents"
BACKUP_DIR="$HOME/backup-system/backups"
LOG_DIR="$HOME/backup-system/logs"
LOG_FILE="$LOG_DIR/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$DATE.tar.gz"
ENCRYPTED_FILE="$BACKUP_FILE.gpg"

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

echo "----------------------------------------" >> "$LOG_FILE"
echo "Backup started at: $(date)" >> "$LOG_FILE"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source folder not found: $SOURCE_DIR" >> "$LOG_FILE"
    echo "Backup failed: source folder not found."
    exit 1
fi

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "Compression successful: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "ERROR: Backup compression failed." >> "$LOG_FILE"
    echo "Backup failed!"
    exit 1
fi

gpg -c "$BACKUP_DIR/$BACKUP_FILE"

if [ $? -eq 0 ]; then
    rm "$BACKUP_DIR/$BACKUP_FILE"
    echo "Encrypted backup successful: $ENCRYPTED_FILE" >> "$LOG_FILE"
    echo "Password protected backup completed successfully!"
    echo "Saved at: $BACKUP_DIR/$ENCRYPTED_FILE"
else
    echo "ERROR: Encryption failed." >> "$LOG_FILE"
    echo "Encryption failed!"
    exit 1
fi

find "$BACKUP_DIR" -name "backup_*.tar.gz.gpg" -type f -mtime +7 -delete

echo "Old encrypted backups older than 7 days deleted." >> "$LOG_FILE"
echo "Backup ended at: $(date)" >> "$LOG_FILE"
