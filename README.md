# Multiarch gstreamer docker images
[![Docker Pulls](https://img.shields.io/docker/pulls/sinamics/gstreamer)](https://hub.docker.com/repository/docker/sinamics/gstreamer)

Ubuntu 21.04-based container images with upstream GStreamer and plugins pre-installed

Following components are present:
* GStreamer
* gst-plugins-base
* gst-plugins-good
* gst-plugins-bad

GStreamer and components are tracking upstream master branches (with minor fixes on top) and are usually updated a few times a month.
There are also builds of stable upstream releases available as well.

Base OS is Ubuntu 21.04.

# Multi arch builds
images on dockerhub support `arm64` `armv7` `amd64`
