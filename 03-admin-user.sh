#!/bin/bash

export VAULT_ADDR="http://localhost:8210"

root_token=$(sed -nE 's/^Initial.*Token: (.*$)/\1/p' vault-init.txt)

vault login token="$root_token"
vault policy write admin admin.hcl
vault auth enable userpass
vault write auth/userpass/users/admin password="admin" policies="admin"
