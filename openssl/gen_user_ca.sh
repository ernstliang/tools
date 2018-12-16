#!/bin/bash

NAME=server
OUTDIR=ServerCA

echo $NAME

ROOTCA=../RootCA
# create folder demoCA
mkdir $OUTDIR

# 
PARAM="/C=CN/ST=ZJ/L=HZ/O=MOLO/OU=IT/CN=www.jcliang.com.cn/emailAddress=lxq520064@126.com"
PASSWD=123456

# 进入目录
cd $OUTDIR

# generate private key
# -des3 
openssl genrsa -passout pass:$PASSWD -out $NAME.key 1024

# generate csr
# openssl req -passin pass:$PASSWD -passout pass:$PASSWD -subj $PARAM -new -key $NAME.key -out $NAME.csr

# generate pem
# openssl req -passin pass:$PASSWD -passout pass:$PASSWD -subj $PARAM -new -keyout tempkey.pem -keyform PEM -out tempreq.pem -outform PEM
openssl req -passin pass:$PASSWD -passout pass:$PASSWD -subj $PARAM -new -key $NAME.key -out tempreq.pem -outform PEM

# copy openssl.cnf 文件到本地目录
# openssl.cnf路径只适用于mac os
OPENSSLCNF=/System/Library/OpenSSL/openssl.cnf
cp $OPENSSLCNF .

# create folder demoCA, newcerts and file index.txt, serial
mkdir -p ./demoCA/newcerts
touch ./demoCA/index.txt
echo 01 > ./demoCA/serial

# generate certificate
# openssl ca -in $NAME.csr -out $NAME.crt -cert $ROOTCA/ca.crt -keyfile $ROOTCA/ca.key -config openssl.cnf
# cat $NAME.crt $NAME.key > $NAME.pem

# generate pem
openssl ca -in tempreq.pem -out server.pem -cert ../RootCA/cacert.pem -keyfile ../RootCA/ca.key -config openssl.cnf