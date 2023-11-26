#!/bin/bash

check_vault_status() {
    status=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:8210/v1/sys/health)
    i=0
    while (( i<10 )); do
        if [[ "$status" != "200" ]]; then
            echo "Vault response is $status. Waiting for a 200 OK..."
            sleep 3
            status=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:8210/v1/sys/health)
        else
            echo "Vault response is $status OK."
            sleep 1
            break
        fi
        ((i++))
    done

    if (( i>9 )); then
        echo "Aborting. Vault does not respond..."
        exit 1
    fi
}

unseal() {
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
}
