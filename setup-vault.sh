#!/bin/bash

# Get unseal function
source unseal.sh

export VAULT_ADDR="http://localhost:8210"
vault operator init -key-shares=6 -key-threshold=3 > vault-init.txt
echo "Vault is initialized"

unseal
echo "The first Vault node is unsealed"

root_token=$(sed -nE 's/^Initial.*Token: (.*$)/\1/p' vault-init.txt)
vault login token="$root_token"
vault policy write admin admin.hcl
vault auth enable userpass
vault write auth/userpass/users/admin password="admin" policies="admin"
echo "Vault admin user created"

leader="http://vault-1:8200"
export VAULT_ADDR="http://localhost:8220"
vault operator raft join "$leader"
unseal
export VAULT_ADDR="http://localhost:8230"
vault operator raft join "$leader"
unseal
echo "The remaining Vault nodes are joined & unsealed. We are good to go"
