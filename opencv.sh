#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=2.4.9
PYTHON_ROOT=/usr/local

# install dependencies

# fetch source code
wget -c http://softlayer-sng.dl.sourceforge.net/project/opencvlibrary/opencv-unix/${VERSION}/opencv-${VERSION}.zip
unzip opencv-${VERSION}

# make
cd opencv-${VERSION}
cmake . -DCMAKE_BUILD_TYPE=RELEASE
# uncomment to add python support
#cmake . -DCMAKE_BUILD_TYPE=RELEASE \
#-DBUILD_NEW_PYTHON_SUPPORT=ON \
#-DPYTHON_EXECUTABLE=${PYTHON_ROOT}/bin/python2.7 \
#-DPYTHON_INCLUDE_DIR=${PYTHON_ROOT}/include/python2.7/ \
#-DPYTHON_LIBRARY=${PYTHON_ROOT}/lib/libpython2.7.so \
#-DPYTHON_NUMPY_INCLUDE_DIR=${PYTHON_ROOT}/lib/python2.7/site-packages/numpy/core/include \
#-DPYTHON_PACKAGES_PATH=${PYTHON_ROOT}/lib/python2.7/site-packages/ \
#-DBUILD_PYTHON_SUPPORT=ON
make -j${CONCURRENCY}

# install
make install
ldconfig
