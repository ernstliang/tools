#!/bin/bash

OUTDIR=RootCA
PASSWD=123456
PARAM="/C=CN/ST=ZJ/L=HZ/O=MOLO/OU=IT/CN=www.jcliang.com.cn/emailAddress=lxq520064@126.com"

# 创建输出目录
mkdir $OUTDIR

# 进入目录
cd $OUTDIR

# Generate CA private key
openssl genrsa -out ca.key 2048

# Generate CSR (CA证书请求)
openssl req -passout pass:$PASSWD -subj $PARAM -new -key ca.key -out ca.csr

# Generate Self Signed certificate (CA根证书)
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt

# Generate Self Signed pem
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out cacert.pem -outform PEM