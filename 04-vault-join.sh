#!/bin/bash

leader="http://vault-1:8200"

VAULT_ADDR="http://localhost:8220" vault operator raft join "$leader"
VAULT_ADDR="http://localhost:8230" vault operator raft join "$leader"
