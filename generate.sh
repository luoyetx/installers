#!/usr/bin/env bash

if [ $# != 1 ]; then echo "Need a filename!"
else

cat > $1 <<EOF
#!/usr/bin/env bash

. BasicConfig.sh

# configure
VERSION=X.X.X

# install dependencies

# fetch source code

# make
make -j\${CONCURRENCY}

# install
make install
EOF

chmod +x $1

fi
