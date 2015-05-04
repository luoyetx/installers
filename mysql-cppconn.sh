#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=1.1.5
CONCURRENCY=2

cd $ROOT

# install dependencies

# fetch source code
wget -c http://cdn.mysql.com/Downloads/Connector-C++/mysql-connector-c++-${VERSION}.tar.gz
tar -zxvf mysql-connector-c++-${VERSION}.tar.gz

# make
cd mysql-connector-c++-${VERSION}
cmake .
make -j${CONCURRENCY}

# install
make install
ldconfig
