#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=1.15
CONCURRENCY=2

cd $ROOT

# install dependencies

# fetch source code
wget http://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.xz
tar --xz -xvf automake-${VERSION}.tar.xz

# make
cd automake-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
