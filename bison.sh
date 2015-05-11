#!/usr/bin/env bash

. BasicConfig.sh
pwd
# configure
VERSION=2.5.1

# install dependencies

# fetch source code
wget -c http://ftp.gnu.org/gnu/bison/bison-${VERSION}.tar.xz
tar --xz -xvf bison-${VERSION}.tar.xz

# make
cd bison-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
