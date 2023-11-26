# vault-docker

Run a three node Hashicorp Vault cluster in Docker with raft storage.  
Strictly lab usage!

# Usage

Run (from this repo):
```
docker-compose up -d
```
Then:
```
./setup-vault.sh
```

### Example:
```
~/vault-docker$ docker-compose up -d
Creating network "vault-docker_default" with the default driver
Creating volume "vault-docker_vault-1" with default driver
Creating volume "vault-docker_vault-2" with default driver
Creating volume "vault-docker_vault-3" with default driver
Creating vault-docker_vault-1_1 ... done
Creating vault-docker_vault-2_1 ... done
Creating vault-docker_vault-3_1 ... done
~/vault-docker$ ./setup-vault.sh 
Initializing Vault...
Vault is initialized
Vault response is 429. Waiting for a 200 OK...
Vault response is 429. Waiting for a 200 OK...
Vault response is 429. Waiting for a 200 OK...
Vault response is 200 OK.
The first Vault node is unsealed
Vault admin user created
The remaining Vault nodes are joined & unsealed. We are good to go.
```

We are now at this status:
- The unseal keys and `root` token has been saved in the file: `vault-init.txt` 
- The Vault cluster is unsealed

_NOTE: You only need to do this on an inital setup (or if you delete the docker volumes).  
Otherwise you can simply unseal Vault with the keys in_ `vault-init.txt`

You can now proceed to log in as user `admin` with the password `admin`.  
The `admin` user have _all_ access.  

Just to reiterate: **STRICTLY LAB USAGE**
