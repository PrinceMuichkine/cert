rm *.pem  # Remove any existing .pem files

# 1. Generate CA's private key and self-signed certificate.
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout ca-key.pem -out ca-cert.pem -subj "/C=MN/ST=Moon/L=Solar System/O=moon.africa/OU=Stellar Transportation/CN=*.moon.africa/emailAddress=hello@moon.africa"

echo "CA's self-signed certificate"

openssl x509 -in ca-cert.pem -noout -text  # Display the CA's self-signed certificate

# 2. Generate web server's private key and certificate signing request (CSR).
openssl req -newkey rsa:4096 -nodes -keyout server-key.pem -out server-req.pem -subj "/C=MN/ST=Moon/L=Solar System/O=moon.africa/OU=Stellar Transportation/CN=*.moon.africa/emailAddress=hellon@moon.africa"

# 3. Use CA's private key to sign web server's CSR and get back the signed certificate.
openssl x509 -req -in server-req.pem -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile server-ext.cnf

echo "Server's signed certificate"

openssl x509 -in server-cert.pem -noout -text  # Display the server's signed certificate

# 4. Verify the server's certificate against the CA's certificate.
openssl verify -CAfile ca-cert.pem server-cert.pem  # Verify the server's certificate