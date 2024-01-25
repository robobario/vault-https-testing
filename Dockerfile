from vault:1.1.3
COPY Vault.hcl /vault/config/Vault.hcl
COPY cert.pem /vault/config/cert.pem
COPY key.pem /vault/config/key.pem
COPY cert.pem /usr/share/ca-certificates/vault/vault-ca.pem
COPY init.sh /vault/init.sh
RUN echo "vault/vault-ca.pem" >> /etc/ca-certificates.conf
RUN update-ca-certificates
ENV VAULT_ADDR="https://localhost:8200"
CMD ["server"]
