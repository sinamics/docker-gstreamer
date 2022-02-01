FROM ubuntu:21.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y \
    openjdk-8-jre \
    libgstreamer1.0-dev gstreamer1.0-omx gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools gstreamer1.0-plugins-bad

