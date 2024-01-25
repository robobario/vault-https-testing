ui            = true
cluster_addr  = "https://127.0.0.1:8201"
api_addr      = "https://0.0.0.0:8200"
disable_mlock = true

listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file      = "/vault/config/cert.pem"
  tls_key_file       = "/vault/config/key.pem"
}

storage "file" {
  path = "/vault/files"
}