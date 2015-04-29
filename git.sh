#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=2.3.7
CONCURRENCY=2

cd $ROOT

# install dependencies
yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-devel

# fetch source code
wget -c https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.xz
xz -d git-${VERSION}.tar.xz
tar -xvf git-${VERSION}.tar

# make
cd git-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
