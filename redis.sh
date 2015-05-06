#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=3.0.1

# install dependencies

# fetch source code
wget -c http://download.redis.io/releases/redis-${VERSION}.tar.gz
tar -zxvf redis-${VERSION}.tar.gz

# make
cd redis-${VERSION}
## deps
cd deps
make jemalloc -j${CONCURRENCY}
make lua -j${CONCURRENCY}
make linenoise -j${CONCURRENCY}
cd ..

make -j${CONCURRENCY}

# install
make install
