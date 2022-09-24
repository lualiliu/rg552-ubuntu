#!/bin/bash
./ch-mount.sh -u ubuntu/
dd if=/dev/zero of=ubuntu.img bs=1M count=8192
sudo mkfs.ext4 -F -L linuxroot ubuntu.img
mkdir ubuntu-mount
sudo mount  ubuntu.img ubuntu-mount
sudo cp -rfp ubuntu/* ubuntu-mount
sudo umount ubuntu-mount
e2fsck -p -f ubuntu.img
resize2fs -M ubuntu.img
mv ubuntu.img input/ubuntu.ext4
./genimage genimage.cfg
