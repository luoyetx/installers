#!/usr/bin/env bash

if [ $# != 1 ]; then echo "Need a filename!"
else

cat > $1 <<EOF
#!/usr/bin/env bash

# configure
ROOT=/usr/local/src
VERSION=X.X.X
CONCURRENCY=2

cd \$ROOT

# install dependencies

# fetch source code

# make
make -j\${CONCURRENCY}

# install
EOF

chmod +x $1

fi
