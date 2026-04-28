#!/bin/bash

BACKUP_DIR="$HOME/backup-system/backups"
RESTORE_DIR="$HOME/backup-system/restored_files"
TEMP_DIR="$HOME/backup-system/temp"

mkdir -p "$RESTORE_DIR" "$TEMP_DIR"

echo "Available encrypted backups:"
ls "$BACKUP_DIR"/*.tar.gz.gpg 2>/dev/null

echo ""
read -p "Enter encrypted backup file name to restore: " BACKUP_FILE

if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    echo "ERROR: Backup file not found!"
    exit 1
fi

DECRYPTED_FILE="$TEMP_DIR/${BACKUP_FILE%.gpg}"

gpg -o "$DECRYPTED_FILE" -d "$BACKUP_DIR/$BACKUP_FILE"

if [ $? -ne 0 ]; then
    echo "ERROR: Decryption failed!"
    exit 1
fi

tar -xzf "$DECRYPTED_FILE" -C "$RESTORE_DIR"

if [ $? -eq 0 ]; then
    echo "Restore completed successfully!"
    echo "Files restored at: $RESTORE_DIR"
    rm "$DECRYPTED_FILE"
else
    echo "Restore failed!"
fi
