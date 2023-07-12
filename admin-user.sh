#!/bin/bash

export VAULT_ADDR="http://localhost:8210"

vault policy write policy-name admin.hcl
vault auth enable userpass
vault write auth/userpass/users/admin password="admin" policies="admin"
