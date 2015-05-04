#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=7.8
CONCURRENCY=2

cd $ROOT

# install dependencies

# fetch source code
wget -c http://ftp.gnu.org/gnu/gdb/gdb-${VERSION}.tar.xz
tar --xz -xvf gdb-${VERSION}.tar.xz

# make
cd gdb-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
