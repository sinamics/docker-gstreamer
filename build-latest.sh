#!/bin/bash
set -e

# docker buildx create --name uavcast_builder
# docker buildx create --name uavcast_builder --driver-opt env.BUILDKIT_STEP_LOG_MAX_SIZE=50000000,env.BUILDKIT_STEP_LOG_MAX_SPEED=100000000 --use
docker buildx use uavcast_builder

# load cross-platform emulator
docker run --privileged --rm tonistiigi/binfmt --install all

# Make sure to always have fresh base image
docker pull ubuntu:21.04

# Build dev image with just binaries
docker buildx build --pull --rm --platform linux/arm/v7,linux/arm64,linux/amd64 -t sinamics/gstreamer:latest -f Dockerfile "." --push 