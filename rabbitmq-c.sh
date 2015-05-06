#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=0.6.0

# install dependencies
yum install -y openssl-devel popt

# fetch source code
wget -c https://github.com/alanxz/rabbitmq-c/archive/v${VERSION}.tar.gz -O rabbitmq-c-${VERSION}.tar.gz
tar -zxvf rabbitmq-c-${VERSION}.tar.gz

# make
cd rabbitmq-c-${VERSION}
cmake .
make -j${CONCURRENCY}

# install
make install
ldconfig
