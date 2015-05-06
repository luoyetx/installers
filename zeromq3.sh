#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=3.2.5

# install dependencies

# fetch source code
wget -c http://download.zeromq.org/zeromq-${VERSION}.tar.gz
tar -zxvf zeromq-${VERSION}.tar.gz

# make
cd zeromq-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
ldconfig
