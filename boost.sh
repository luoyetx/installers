#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=1.58.0
CONCURRENCY=2

PYTHON=2.7

cd $ROOT

# install dependencies

# fetch source code
VERSION_=${VERSION//\./_}
wget -c http://jaist.dl.sourceforge.net/project/boost/boost/${VERSION}/boost_${VERSION_}.tar.bz2
tar --bzip2 -xvf boost_${VERSION_}.tar.bz2

# make
cd boost_${VERSION_}
./bootstrap.sh --with-python=python${PYTHON}
./b2 -j${CONCURRENCY}

# install
./b2 install
ldconfig
