FROM alpine:latest

RUN apk add --no-cache wget unzip ca-certificates

WORKDIR /app

RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && \
    rm v2ray-linux-64.zip && \
    chmod +x /app/v2ray

COPY config.json /app/

EXPOSE 8080

ENTRYPOINT ["./v2ray", "run"]