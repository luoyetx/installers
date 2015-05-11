#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=4.8.4

# install dependencies
yum install -y zlib-devel

# fetch source code
wget -c http://ftp.gnu.org/gnu/gcc/gcc-${VERSION}/gcc-${VERSION}.tar.bz2
tar -j -xvf gcc-${VERSION}.tar.bz2

# make
cd gcc-${VERSION}
./contrib/download_prerequisites
# configure params are copied from CentOS6.6 gcc4.4.7 and remove language java, ada
./configure --prefix=/usr/local --mandir=/usr/local/share/man --infodir=/usr/local/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-languages=c,c++,objc,obj-c++,fortran --disable-dssi --enable-libgcj-multifile --with-ppl --with-cloog --with-tune=generic --disable-multilib
make -j${CONCURRENCY}

# install
make install
ln -s /usr/local/bin/gcc /usr/local/bin/cc
ldconfig
