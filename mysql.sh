#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=5.6.23
CONCURRENCY=2

PREFIX=/usr/local/mysql
DATAROOT=${PREFIX}/data
mkdir -p ${DATAROOT}
groupadd mysql
useradd -r -g mysql mysql 

cd $ROOT

# install dependencies
yum install -y ncurses-devel perl

# fetch source code
wget -c http://cdn.mysql.com/archives/mysql-5.6/mysql-${VERSION}.tar.gz
tar -zxvf mysql-${VERSION}.tar.gz

# make
cd mysql-${VERSION}

cmake \
-DCMAKE_INSTALL_PREFIX=${PREFIX} \
-DMYSQL_UNIX_ADDR=${PREFIX}/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_ARCHIVE_STORAGE_ENGINE=1 \
-DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
-DMYSQL_DATADIR=${DATAROOT} \
-DMYSQL_TCP_PORT=3306 \
-DENABLE_DOWNLOADS=1

make -j${CONCURRENCY}

# install
make install
ldconfig

# extra
chown -R mysql:mysql ${PREFIX}
chown -R mysql:mysql ${DATAROOT}

cd ${PREFIX}
cp support-files/my-default.cnf /etc/my.cnf
cp support-files/mysql.server /etc/init.d/mysqld
./scripts/mysql_install_db --user=mysql --datadir=${DATAROOT}
