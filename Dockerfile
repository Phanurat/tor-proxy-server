FROM alpine:latest

RUN apk update && \
    apk add tor && \
    mkdir -p /var/lib/tor

COPY torrc /etc/tor/torrc

CMD ["tor", "-f", "/etc/tor/torrc"]
