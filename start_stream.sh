#!/bin/sh

# Yahan apna YouTube stream key daal
STREAM_KEY="pxks-t44r-qk1t-bm6p-b1z5"

# Google Drive se public direct video link
VIDEO_URL="https://drive.google.com/uc?export=download&id=1-tQODaM0rMTGuafHdvhUKRidPfAeqvHE"

# Download video
curl -L "$VIDEO_URL" -o input.mp4

# Start streaming in loop
while true
do
  ffmpeg -re -stream_loop -1 -i input.mp4 \
    -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k \
    -c:a aac -b:a 160k -ar 44100 \
    -f flv "rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY"
done

