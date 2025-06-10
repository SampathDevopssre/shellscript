#!/bin/bash

# Vault base path for nginx
VAULT_PATH="secret/path/certs"

# List of secrets to delete
SECRETS=(
want need to delete files.
)

# Confirm deletion
read -p "⚠️ Are you sure you want to delete these secrets from Vault? (yes/no): " CONFIRM
if [[ "$CONFIRM" != "yes" ]]; then
  echo "❌ Deletion cancelled."
  exit 1
fi

# Loop through and delete each secret
for SECRET in "${SECRETS[@]}"; do
  echo "Deleting $SECRETS..."
  vault delete "$VAULT_PATH/$SECRET"
done

echo "✅ Deletion completed."
