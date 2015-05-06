#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=2.69

# install dependencies

# fetch source code
wget -c http://ftp.gnu.org/gnu/autoconf/autoconf-${VERSION}.tar.gz
tar -zxvf autoconf-${VERSION}.tar.gz

# make
cd autoconf-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
