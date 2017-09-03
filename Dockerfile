FROM alpine:3.6
RUN apk update
RUN apk add python3 darkhttpd
RUN adduser -D -h /home/plexurl plexurl
RUN chown -R plexurl:plexurl /home/plexurl && umask 002 /home/plexurl
COPY . /home/plexurl/plexurl/
WORKDIR /home/plexurl/plexurl
RUN pip3 install -e .
RUN git clone https://github.com/eyedeekay/plexurl-helpers /home/plexurl/plexurl-helpers
RUN cd /home/plexurl/plexurl-helpers && make install
USER plexurl
CMD [ "darkhttpd", "/home/plexurl/" ]

