#1/bin/bash

VAULT_ADDR="http://localhost:8210"

vault operator init -key-shares=6 -key-threshold=3 > vault-init.txt
