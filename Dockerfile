FROM alpine:latest

RUN apk update && apk add tor

# สร้าง user ที่ไม่มี root
RUN adduser -D -H -u 1000 toruser

# เตรียม directory ที่ tor ใช้
RUN mkdir -p /var/lib/tor && chown -R toruser /var/lib/tor

# คัดลอก torrc
COPY torrc /etc/tor/torrc
RUN chown toruser /etc/tor/torrc

# เปลี่ยนมาใช้ user ที่ไม่ใช่ root
USER toruser

CMD ["tor", "-f", "/etc/tor/torrc"]
