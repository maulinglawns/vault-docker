#!/bin/bash

export VAULT_ADDR="http://localhost:8210"

i=0

while read -r line; do
    if (( i < 3 )); then
        if [[ "$line" =~ ^Unseal ]]; then
            key=$(echo "$line" | awk '{ print $4 }')
        fi
        vault operator unseal "$key"
        ((i++))
    fi
done < vault-init.txt
