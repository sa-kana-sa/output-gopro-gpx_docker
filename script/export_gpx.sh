#!/bin/sh

GOPRO2GPX=~/go/bin/gopro2gpx

# Directory
MP4_DIR=./mp4/
BIN_DIR=./bin/
GPX_DIR=./gpx/

# Extension
BIN_EXT=.bin
GPX_EXT=.gpx
 
for FILE in `ls ${MP4_DIR}*.mp4`; do
    FILE_BASE=${FILE%.*}
    MP4_FILE=${MP4_DIR}${FILE}
    BIN_FILE=${BIN_DIR}${FILE_BASE}${BIN_EXT}
    GPX_FILE=${GPX_DIR}${FILE_BASE}${GPX_EXT}

    ffmpeg -y -i "${MP4_FILE}" -codec copy -map 0:3 -f rawvideo "${BIN_FILE}" && \
        gopro2gpx -i "${BIN_FILE}" -o "${GPX_FILE}"
done
