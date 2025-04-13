FROM ubuntu:latest

RUN apt-get update && apt-get install -y ffmpeg curl

COPY start_stream.sh /start_stream.sh
RUN chmod +x /start_stream.sh

CMD ["/start_stream.sh"]
