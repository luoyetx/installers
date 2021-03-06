#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=0.3.4

# install dependencies

# fetch source code
wget -c https://github.com/google/glog/archive/v${VERSION}.tar.gz
tar -zxvf v${VERSION}.tar.gz

# make
cd glog-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
ldconfig
