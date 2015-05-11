#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=2.6.1

cd $SOURCE_ROOT

# install dependencies

# fetch source code
wget -c https://github.com/google/protobuf/releases/download/v${VERSION}/protobuf-${VERSION}.tar.bz2
tar -j -xvf protobuf-${VERSION}.tar.bz2

# make
cd protobuf-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install 
ldconfig
