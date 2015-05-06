#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=2.7.9

# install dependencies
yum install -y zlib-devel bzip2-devel openssl-devel xz-libs sqlite-devel path readline-devel

# fetch source code
wget -c https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tar.xz
xz -d Python-${VERSION}.tar.xz
tar -xvf Python-${VERSION}.tar

# make
cd Python-${VERSION}
./configure --enable-shared
make -j${CONCURRENCY}

# install
make altinstall
ldconfig

# extra
cd $ROOT
wget https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py
python2.7 get-pip.py
