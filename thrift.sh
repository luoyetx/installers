#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=0.9.2
CONCURRENCY=2

cd $ROOT

# install dependencies
yum install -y libevent-devel zlib-devel openssl-devel

# fetch source code
wget -c http://mirrors.hust.edu.cn/apache/thrift/${VERSION}/thrift-${VERSION}.tar.gz
tar -zxvf thrift-${VERSION}.tar.gz

# make
cd thrift-${VERSION}
./bootstrap
./configure --with-lua=no --with-python=no
make -j${CONCURRENCY}

# install
make install
