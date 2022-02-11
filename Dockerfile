FROM ubuntu:20.04

WORKDIR /opt/workspace
 
# Install required package
RUN apt-get update && \
    apt-get -y install tzdata && \
    apt-get -y install ffmpeg git golang

# SET golang path
ENV PATH $PATH:/root/go/bin

# Install golang package
# https://github.com/ben-milanko/gopro-utils/
RUN go get github.com/ben-milanko/gopro-utils/bin/gopro2gpx && \
    go install github.com/ben-milanko/gopro-utils/bin/gopro2gpx

# Execute script
ENTRYPOINT ["/bin/sh", "./script/export_gpx.sh"]