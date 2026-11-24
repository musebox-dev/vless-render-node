# VLESS-over-WebSocket node for Render's free Web Service tier.
# Xray-core is pinned to v26.11.9 (verified 2026-11-24).
FROM alpine:3.20

RUN apk add --no-cache ca-certificates curl unzip \
    && curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip \
    && unzip -q /tmp/xray.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/xray \
    && rm /tmp/xray.zip \
    && apk del curl unzip

COPY entrypoint.sh /entrypoint.sh
COPY config.json /etc/xray/config.template.json
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
