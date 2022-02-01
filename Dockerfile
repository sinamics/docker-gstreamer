FROM ubuntu:21.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y \
    openjdk-8-jre \
    libgstreamer1.0-dev gstreamer1.0-omx gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly


# gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,width=1920,height=1080 ! videoflip video-direction=identity ! videoconvert ! video/x-raw,format=I420 ! queue max-size-buffers=1 name=q_enc ! x264enc tune=zerolatency bitrate=2000 speed-preset=superfast ! rtph264pay name=pay0 pt=96 ! multiudpsink clients=10.0.0.49
