#!/bin/bash

VAULT_ADDR="http://127.0.0.1:8200"

i=0

while read -r line; do
    if (( i < 3 )); then
        vault operator unseal "$line"
        ((i++))
    fi
done < unseal-keys.txt
