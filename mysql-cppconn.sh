#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=1.1.5

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
