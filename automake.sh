#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=1.15

# install dependencies

# fetch source code
wget -c http://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.xz
tar --xz -xvf automake-${VERSION}.tar.xz

# make
cd automake-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
