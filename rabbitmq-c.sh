#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=0.6.0
CONCURRENCY=2

cd $ROOT

# install dependencies
yum install -y openssl-devel popt

# fetch source code
wget -c https://github.com/alanxz/rabbitmq-c/releases/download/v0.6.0/rabbitmq-c-${VERSION}.tar.gz
tar -zxvf rabbitmq-c-${VERSION}.tar.gz

# make
cd rabbitmq-c-${VERSION}
cmake .
make -j${CONCURRENCY}

# install
make install
ldconfig
