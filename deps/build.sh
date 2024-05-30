#!/bin/bash

set -e

OPENWRT_BRANCH=main

mkdir -p /vendor/
cd /vendor/
git clone -b $OPENWRT_BRANCH https://github.com/kuleshov-aleksei/openwrt-bpi-r4 openwrt

cp /deps/feeds.conf.default /vendor/openwrt/feeds.conf.default
cd /vendor/
wget https://downloads.openwrt.org/releases/22.03.0/targets/bcm27xx/bcm2711/openwrt-toolchain-22.03.0-bcm27xx-bcm2711_gcc-11.2.0_musl.Linux-x86_64.tar.xz
tar -xvf openwrt-toolchain-22.03.0-bcm27xx-bcm2711_gcc-11.2.0_musl.Linux-x86_64.tar.xz
export PATH="/vendor/openwrt-toolchain-22.03.0-bcm27xx-bcm2711_gcc-11.2.0_musl.Linux-x86_64/toolchain-aarch64_cortex-a72_gcc-11.2.0_musl/bin:$PATH"
cd /vendor/openwrt

./scripts/feeds update -a
./scripts/feeds install -a

cp /deps/.config /vendor/openwrt/.config

# Run this manually to customize build
#make menuconfig

make -j$(nproc) V=s
cp bin/targets/mediatek/filogic/openwrt-snapshot-*-sdcard.img.gz /build/
