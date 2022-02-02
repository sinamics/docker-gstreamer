FROM ubuntu:21.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y \
    openjdk-8-jre \
    libgstreamer1.0-dev gstreamer1.0-omx gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly

ENTRYPOINT [ "/usr/bin/gst-launch-1.0" ]
CMD [ "-v" ]
# video/x-raw
# gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,width=1920,height=1080 ! videoflip video-direction=identity ! videoconvert ! video/x-raw,format=I420 ! queue max-size-buffers=1 name=q_enc ! x264enc tune=zerolatency bitrate=2000 speed-preset=superfast ! rtph264pay name=pay0 pt=96 ! multiudpsink clients=10.0.0.49

# video/x-h264
# gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-h264,width=1920,height=1080 ! videoflip video-direction=identity ! videoconvert ! video/x-h264,format=I420 ! queue max-size-buffers=1 name=q_enc ! x264enc tune=zerolatency bitrate=2000 speed-preset=superfast ! h264parse ! rtph264pay name=pay0 pt=96 ! multiudpsink clients=10.0.0.49

# videotestsrc ! x264enc ! video/x-h264, stream-format=byte-stream ! rtph264pay ! udpsink host=GCS_ADDRESS port=5600