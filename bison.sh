#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=2.5.1
CONCURRENCY=2

cd $ROOT

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
