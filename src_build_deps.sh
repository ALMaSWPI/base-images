#!/bin/sh

set -e

echo "Target platform: $1"

# Build and install libsockcanpp
git clone https://github.com/ALMaSWPI/libsockcanpp.git
cd libsockcanpp
cmake --toolchain toolchains/$1-toolchain.cmake -DBUILD_SHARED_LIBS=ON -Bbuild
cmake --build build --parallel --target install
echo "libsockcanpp installed!"

# Build and install Serial
git clone https://github.com/ALMaSWPI/serial.git
cd serial
cmake -DBUILD_SHARED_LIBS=ON -Bbuild
cmake --build build --parallel --target install
echo "libserial installed!"
