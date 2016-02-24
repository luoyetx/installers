#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=0.9.2

# install dependencies
yum install -y libevent-devel zlib-devel openssl-devel

# fetch source code
wget -c http://apache.fayea.com/thrift/${VERSION}/thrift-${VERSION}.tar.gz
tar -zxvf thrift-${VERSION}.tar.gz

# make
cd thrift-${VERSION}
./configure --with-qt4=no --with-lua=no --with-python=no
make -j${CONCURRENCY}

# install
make install
