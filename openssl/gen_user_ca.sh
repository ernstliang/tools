#!/bin/bash

ROOTCA=../RootCA
OUTFOLDER=UserCA
# create folder demoCA
mkdir $OUTFOLDER

# 进入目录
cd $OUTFOLDER

PASSWD=ETW@87uip

# generate private key
openssl genrsa -passout pass:$PASSWD -des3 -out server.key 1024

# generate csr
openssl req -passin pass:$PASSWD -passout pass:$PASSWD -subj "/C=CN/ST=ZJ/L=HZ/O=MOLO/OU=IT/CN=Rational Performance Tester CA/emailAddress=LXQ520064@126.com" -new -key server.key -out server.csr

# copy openssl.cnf 文件到本地目录
OPENSSLCNF=/System/Library/OpenSSL/openssl.cnf
cp $OPENSSLCNF .

# create folder demoCA, newcerts and file index.txt, serial
mkdir -p ./demoCA/newcerts
touch ./demoCA/index.txt
echo 00 > ./demoCA/serial

# generate certificate
openssl ca -in server.csr -out server.crt -cert $ROOTCA/ca.crt -keyfile $ROOTCA/ca.key -config openssl.cnf