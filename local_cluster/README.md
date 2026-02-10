# Vault Enterprise local cluster on docker

Create `.env` file:
```
VAULT_LICENSE=...
```

Run docker compose:
```bash
# Run docker compose
docker compose up -d

# make sure all containers run correctly
docker compose logs
```

Initialize and unseal the vault at vault0:

```
❯ docker exec -it vault0 sh
/ # export VAULT_ADDR=http://127.0.0.1:8200
/ # vault operator init -key-shares=1 -key-threshold=1
/ # vault operator unseal <unseal-key>
```

Unseal vault1:
```
❯ docker exec -it vault1 sh
/ # export VAULT_ADDR=http://127.0.0.1:8200
/ # vault operator unseal <unseal-key>
```

Unseal vault2:
```
❯ docker exec -it vault2 sh
/ # export VAULT_ADDR=http://127.0.0.1:8200
/ # vault operator unseal <unseal-key>
```

Verify the peering status:
```
/ # vault operator raft list-peers
Node      Address        State       Voter
----      -------        -----       -----
vault0    vault0:8201    leader      true
vault1    vault1:8201    follower    true
vault2    vault2:8201    follower    true
```