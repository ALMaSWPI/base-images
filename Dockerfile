FROM --platform=$BUILDPLATFORM ros:humble-ros-core AS build

ARG TARGETPLATFORM

COPY ./src_build_deps.sh /opt/scripts/src_build_deps.sh
RUN chmod u+x /opt/scripts/src_build_deps.sh

RUN case ${TARGETPLATFORM} in \
         "linux/amd64")  TOOLCHAIN_PREFIX=x86_64  ;; \
         "linux/arm64")  TOOLCHAIN_PREFIX=arm64  ;; \
         "linux/arm/v7") TOOLCHAIN_PREFIX=armhf  ;; \
         "linux/arm/v6") TOOLCHAIN_PREFIX=armel  ;; \
         "linux/386")    TOOLCHAIN_PREFIX=i386   ;; \
    esac
RUN /opt/scripts/src_build_deps.sh "${TOOLCHAIN_PREFIX}"

FROM ros:humble-ros-core

RUN apt update
RUN apt install -y git ros-humble-pinocchio

