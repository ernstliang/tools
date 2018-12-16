#!/bin/bash

OUTDIR=RootCA
mkdir $OUTDIR

# 进入目录
cd $OUTDIR

# Generate CA private key
openssl genrsa -out ca.key 2048

# Generate CSR (CA证书请求)
openssl req -passout pass:ETW@87uip -subj "/C=CN/ST=ZJ/L=HZ/O=MOLO/OU=IT/CN=Rational Performance Tester CA/emailAddress=LXQ520064@126.com" -new -key ca.key -out ca.csr

# Generate Self Signed certificate (CA根证书)
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt