#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=7.8

# install dependencies

# fetch source code
wget -c http://ftp.gnu.org/gnu/gdb/gdb-${VERSION}.tar.xz
tar -J -xvf gdb-${VERSION}.tar.xz

# make
cd gdb-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
