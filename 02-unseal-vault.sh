#!/bin/bash

# Get unseal function
source unseal.sh

export VAULT_ADDR="http://localhost:8210"
unseal
