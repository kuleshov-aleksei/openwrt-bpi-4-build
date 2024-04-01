#!/bin/bash

OPENWRT_BRANCH=openwrt-23.05

mkdir -p /vendor/
cd /vendor/
git clone -b $(OPENWRT_BRANCH) https://github.com/kuleshov-aleksei/openwrt-bpi-r4 openwrt

cd /vendor/openwrt

./scripts/feeds update -a
./scripts/feeds install -a

make menuconfig

make -j$(nproc) defconfig download clean world
