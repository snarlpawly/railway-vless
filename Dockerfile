FROM alpine:latest
RUN apk add --no-cache curl unzip ca-certificates && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && unzip /tmp/xray.zip -d /usr/local/bin/ && chmod +x /usr/local/bin/xray && rm /tmp/xray.zip
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
CMD ["/entry.sh"]
