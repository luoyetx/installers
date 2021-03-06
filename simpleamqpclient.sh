#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=2.4.0

# install dependencies

# fetch source code
wget -c https://github.com/alanxz/SimpleAmqpClient/archive/v${VERSION}.tar.gz -O SimpleAmqpClient-${VERSION}.tar.gz
tar -zxvf SimpleAmqpClient-${VERSION}.tar.gz

# make
cd SimpleAmqpClient-${VERSION}
cmake .
make -j${CONCURRENCY}

# install
make install
ldconfig
