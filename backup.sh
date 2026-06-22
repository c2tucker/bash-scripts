#!/bin/bash

# Purpose: Backup a target directory or destination
# Date: 6/21/2026
# Usage: ./backup.sh <target directory>

TARGET=$1

TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

DEST=~/backups

mkdir -p $DEST

tar -czf $DEST/backup_$TIMESTAMP.tar.gz $TARGET

echo "Backup complete!"
echo "Source:      $TARGET"
echo "Saved to:    $DEST/backup_$TIMESTAMP.tar.gz"
