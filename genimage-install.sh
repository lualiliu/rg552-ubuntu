#!/bin/bash

# download and create genimage by nagel

#update ubuntu
sudo apt install -y autoconf
sudo apt install -y gcc
sudo apt-get install -y make
sudo apt-get install -y genext2fs
sudo apt-get update -y
sudo apt-get install -y libconfuse-dev

rm -rf download

git clone https://github.com/pengutronix/genimage.git download

pushd download 

./autogen.sh

./configure CFLAGS='-g -O0' --prefix=/usr

make

popd

if [ -e download/genimage ]
then
    cp download/genimage .
    rm -rf download
    echo "creation of genimage successful"
else
    echo "creation of genimage failed"
fi;
