#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=3.2.5
CONCURRENCY=2

cd $ROOT

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
