FROM --platform=$BUILDPLATFORM ros:humble-ros-core AS build

ARG TARGETPLATFORM
# RUN compile --target=$TARGETPLATFORM -o /out/mybinary

FROM ros:humble-ros-core

RUN --mount=type=secret,id=github_token \
  cat /run/secrets/github_token

RUN apt update
RUN apt install -y ros-humble-pinocchio
# COPY --from=build /out/mybinary /bin
