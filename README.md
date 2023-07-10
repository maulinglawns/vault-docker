# vault-docker

Run a three node Hashicorp Vault cluster in Docker with raft storage.  
Strictly lab usage!

# Usage
````
docker-compose up
````
# Initialize
If this is the _first_ time, we need to initialize. Run:
````
./init-vault.sh
````
# Unseal
````
./unseal-vault.sh
````
