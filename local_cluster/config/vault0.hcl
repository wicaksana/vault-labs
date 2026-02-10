storage "raft" {
  path    = "/vault/data"
  # On vault1, change this to "vault0:8201", etc.
  node_id = "vault0" 
  retry_join {
    leader_api_addr = "http://vault0:8200"
  }
  retry_join {
    leader_api_addr = "http://vault1:8200"
  }
  retry_join {
    leader_api_addr = "http://vault2:8200"
  }
}

listener "tcp" {
  address     = "0.0.0.0:8200"
#  cluster_address = "0.0.0.0:8201"
  tls_disable = 1
}

# This allows nodes to find each other on the 'vault' docker network
api_addr = "http://vault0:8200"
cluster_addr = "http://vault0:8201"

ui = true
disable_mlock = false