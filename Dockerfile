FROM alpine:latest

RUN apk update && apk add tor

# สร้าง user ใหม่
RUN adduser -D -H -u 1000 toruser

# ตั้ง directory และ permission
RUN mkdir -p /var/lib/tor && chown -R toruser /var/lib/tor

# คัดลอก torrc
COPY torrc /etc/tor/torrc
RUN chown toruser /etc/tor/torrc

# สลับเป็น non-root user
USER toruser

CMD ["tor", "-f", "/etc/tor/torrc"]
