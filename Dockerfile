FROM --platform=$BUILDPLATFORM ros:humble-ros-core

RUN apt update
RUN apt install -y git build-essential cmake gcc-aarch64-linux-gnu g++-aarch64-linux-gnu ros-humble-pinocchio

RUN cmake --version

ARG TARGETPLATFORM

COPY ./src_build_deps.sh /opt/scripts/src_build_deps.sh
RUN chmod u+x /opt/scripts/src_build_deps.sh

RUN case ${TARGETPLATFORM} in \
         "linux/amd64")  TOOLCHAIN_PREFIX=x86_64  ;; \
         "linux/arm64")  TOOLCHAIN_PREFIX=arm64  ;; \
         "linux/arm/v7") TOOLCHAIN_PREFIX=armhf  ;; \
         "linux/arm/v6") TOOLCHAIN_PREFIX=armel  ;; \
    esac \
    && /bin/bash /opt/scripts/src_build_deps.sh ${TOOLCHAIN_PREFIX}

