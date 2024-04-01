#!/bin/bash

set -e

OPENWRT_BRANCH=openwrt-23.05

mkdir -p /vendor/
cd /vendor/
git clone -b $OPENWRT_BRANCH https://github.com/kuleshov-aleksei/openwrt-bpi-r4 openwrt

cd /vendor/openwrt
cp /deps/.config /vendor/openwrt/.config

./scripts/feeds update -a
./scripts/feeds install -a

# Run this manually to customize build
#make menuconfig

make -j$(nproc) defconfig download clean world
