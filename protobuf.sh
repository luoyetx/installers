#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=2.6.1
CONCURRENCY=2

cd $ROOT

# install dependencies

# fetch source code
wget -c https://github.com/google/protobuf/releases/download/v${VERSION}/protobuf-${VERSION}.tar.bz2
tar --bzip2 -xvf protobuf-${VERSION}.tar.bz2

# make
cd protobuf-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install 
ldconfig
