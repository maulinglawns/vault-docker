# vault-docker

Run a three node Hashicorp Vault cluster in Docker with raft storage.  
Strictly lab usage!

# Usage
````
docker-compose up
````
Run the helper scripts in the order they are named: `01 ... 04`

When you have executed the final script (`04-vault-join.sh`):
- The unseal keys and `root` token has been saved in the file: `vault-init.txt` 
- vault node 1 (http://localhost:8210) is unsealed  
- Unseal node 2 (http://localhost:8220) via the web GUI
- Unseal node 3 (http://localhost:8230) via the web GUI  

_NOTE: You only need to do this on an inital setup (or if you delete the docker volumes).  
Otherwise you can simply unseal Vault with the keys in_ `vault-init.txt`

You can now proceed to log in as user `admin` with the password `admin`.  
The `admin` user have _all_ access.  

Just to reiterate: **STRICTLY LAB USAGE**
