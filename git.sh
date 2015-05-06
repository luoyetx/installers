#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=2.3.7

# install dependencies
yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-devel

# fetch source code
wget -c https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.xz
tar -xz -xvf git-${VERSION}.tar

# make
cd git-${VERSION}
./configure
make -j${CONCURRENCY}

# install
make install
