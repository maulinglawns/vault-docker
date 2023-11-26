#!/bin/bash

# Get unseal function
source functions.sh

echo "Initializing Vault..."
export VAULT_ADDR="http://localhost:8210"
vault operator init -key-shares=6 -key-threshold=3 > vault-init.txt
if [[ -s vault-init.txt ]]; then
    echo "Vault is initialized"
    sleep 1
else
    echo "Failed initializing Vault. Aborting."
    exit 1
fi

unseal &>/dev/null
check_vault_status
echo "The first Vault node is unsealed"

root_token=$(sed -nE 's/^Initial.*Token: (.*$)/\1/p' vault-init.txt)
vault login token="$root_token" &>/dev/null
vault policy write admin admin.hcl &>/dev/null
vault auth enable userpass &>/dev/null
vault write auth/userpass/users/admin password="admin" policies="admin" &>/dev/null 
echo "Vault admin user created"
sleep 1

leader="http://vault-1:8200"
export VAULT_ADDR="http://localhost:8220"
vault operator raft join "$leader" &>/dev/null
unseal &>/dev/null
export VAULT_ADDR="http://localhost:8230"
vault operator raft join "$leader" &>/dev/null
unseal &>/dev/null
echo "The remaining Vault nodes are joined & unsealed. We are good to go."
