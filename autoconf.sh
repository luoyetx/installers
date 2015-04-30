#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=2.69
CONCURRENCY=2

cd $ROOT

# install dependencies

# fetch source code
wget http://ftp.gnu.org/gnu/autoconf/autoconf-${VERSION}.tar.gz
tar -zxvf autoconf-${VERSION}.tar.gz

# make
cd autoconf-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
