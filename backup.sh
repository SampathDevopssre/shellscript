#!/bin/bash

# Vault base path for kong
VAULT_PATH="secret/path/certs"
# Backup output base directory
BACKUP_DIR=~/vault_backups_dir_date

# List of secrets to back up
SECRETS=(
files list1
files list2
files list3
files list4
files list5
)

# Create output directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Loop through each secret and back it up
for SECRET in "${SECRETS[@]}"; do
  echo "Backing up $SECRET..."
  vault read "$VAULT_PATH/$SECRET" > "$BACKUP_DIR/${SECRET}.backup"
done

echo "✅ Backup completed to $BACKUP_DIR"

chmod +x vault_backup_kong.sh
