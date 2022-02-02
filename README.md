# Multiarch gstreamer docker images
[![Docker Pulls](https://img.shields.io/docker/pulls/sinamics/gstreamer)](https://hub.docker.com/repository/docker/sinamics/gstreamer)

Ubuntu 21.04-based container images with GStreamer and plugins pre-installed\
supports `arm64` `armv7` `amd64`
Following components are present:
* GStreamer 1.18.4
* gst-plugins-base
* gst-plugins-good
* gst-plugins-bad
* gst-plugins-ugly

## Usage
Examples:\
Gst test video from docker container. (change host ip to match yours)
```docker
docker run --rm -it sinamics/gstreamer videotestsrc ! x264enc ! video/x-h264, stream-format=byte-stream ! rtph264pay ! udpsink host=10.0.0.49 port=5600
```

Receiver command
```python
gst-launch-1.0 -v udpsrc port=5600 caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264" ! rtpjitterbuffer ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false
```

Base OS is Ubuntu 21.04.
