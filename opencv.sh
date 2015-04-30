#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=2.4.10
CONCURRENCY=2

cd $ROOT

# install dependencies

# fetch source code
wget -c http://softlayer-sng.dl.sourceforge.net/project/opencvlibrary/opencv-unix/${VERSION}/opencv-${VERSION}.zip
unzip opencv-${VERSION}

# make
cd opencv-${VERSION}
cmake -DCMAKE_BUILD_TYPE=RELEASE .
make -j${CONCURRENCY}

# install
make install
ldconfig
