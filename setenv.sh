#!/bin/bash
wget http://cdimage.ubuntu.com/ubuntu-base/releases/20.04.5/release/ubuntu-base-20.04.5-base-arm64.tar.gz
mkdir ubuntu
sudo tar -xpf ubuntu-base-14.04-core-armhf.tar.gz -C ubuntu
sudo apt-get install qemu-user-static
cd ubuntu
sudo cp /usr/bin/qemu-aarch64-static usr/bin/
sudo cp -b /etc/resolv.conf  etc/resolv.conf
./ch-mount.sh -m ubuntu/
