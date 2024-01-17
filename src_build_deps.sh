#!/bin/sh

echo "Target platform: $1"

# Build and install libsockcanpp
git clone https://github.com/SimonCahill/libsockcanpp.git
cd libsockcanpp
cmake --toolchain ../../tools/$1-toolchain.cmake -DBUILD_SHARED_LIBS=ON -Bbuild
cmake --build build --parallel --target install

