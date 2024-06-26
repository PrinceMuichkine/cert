# cert

This project is designed to facilitate the creation and management of TLS certificates. It includes scripts and configuration files necessary for generating certificate authority (CA) certificates, server certificates, and related keys. This is useful for setting up secure communications for web servers or other networked services.

## Files

- **`ca-cert.pem`**: The public certificate for the Certificate Authority (CA).
- **`ca-cert.srl`**: The serial number file for the CA.
- **`ca-key.pem`**: The private key for the CA.
- **`gen.sh`**: A shell script for generating the certificates and keys.
- **`server-cert.pem`**: The public certificate for the server.
- **`server-ext.cnf`**: Configuration file for the server certificate extensions.
- **`server-key.pem`**: The private key for the server.
- **`server-req.pem`**: The certificate signing request (CSR) for the server.

## Usage

### 1. Generate Certificates

Run the `gen.sh` script to generate the necessary certificates and keys.

```markdown
./gen.sh
```

### 2. Deploy Certificates

Use the generated `server-cert.pem` and `server-key.pem` to configure your web server or other services to enable SSL/TLS.

## Purpose

The primary purpose of this project is to provide a simple and automated way to generate and manage TLS certificates, ensuring secure communication for your services.
