#!/bin/bash

# Get unseal function
source unseal.sh

leader="http://vault-1:8200"

export VAULT_ADDR="http://localhost:8220"
vault operator raft join "$leader"
unseal

export VAULT_ADDR="http://localhost:8230"
vault operator raft join "$leader"
unseal
