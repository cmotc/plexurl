FROM alpine:edge
RUN apk update
RUN apk add python3
COPY . /home/plexurl/plexurl/
WORKDIR /home/plexurl/plexurl
RUN pip3 install -e .
