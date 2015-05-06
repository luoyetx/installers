#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=3.2.2

# install dependencies

# fetch source code
wget -c http://www.cmake.org/files/v3.2/cmake-${VERSION}.tar.gz
tar -zxvf cmake-${VERSION}.tar.gz

# make
cd cmake-${VERSION}
./bootstrap
./configure
make -j${CONCURRENCY}

# install
make install
