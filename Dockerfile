FROM alpine:3.5
RUN apk update
RUN apk add python3 darkhttpd
RUN adduser -H /home/plexurl plexurl
COPY . /home/plexurl/plexurl/
WORKDIR /home/plexurl/plexurl
RUN pip3 install -e .
USER plexurl
CMD [ "darkhttpd", "/home/plexurl/" ]

