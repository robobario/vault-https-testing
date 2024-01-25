#! /bin/sh
vault operator init -key-shares=1 -key-threshold=1 -format=yaml > /tmp/vault.yaml
export VAULT_TOKEN="$(grep root /tmp/vault.yaml | awk '{print $2}')"
export UNSEAL_KEY="$(grep unseal_keys_hex -A 1 /tmp/vault.yaml | tail -n1 | awk '{ print $2 }')"
vault operator unseal "${UNSEAL_KEY}"
vault secrets enable transit
vault write -f transit/keys/test
echo "Vault api on https://0.0.0.0:8200 with root token: ${VAULT_TOKEN}"
