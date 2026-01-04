# Use the lightweight Python base image
FROM python:3.11.0-slim-bullseye

# Install FFmpeg and required dependencies
RUN apt-get -y update && apt-get install -y ffmpeg

# Copy the MP3 files and playlist into the container
COPY quran.mp3 playlist.txt /app/

# Set the working directory
WORKDIR /app 

# Start the FFmpeg stream
CMD ["ffmpeg", "-re", "-stream_loop", "-1", "-i", "https://server8.mp3quran.net/download/frs_a/002.mp3", "-c:a", "aac", "-f", "flv", "rtmps://dc4-1.rtmp.t.me/s/2519683084:WtASbEKfu1AWCSWEo94cgA"]
