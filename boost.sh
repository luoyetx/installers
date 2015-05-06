#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=1.58.0
PYTHON=2.7

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
