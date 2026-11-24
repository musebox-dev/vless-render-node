#!/bin/sh
# Entry point for the VLESS node on Render.
# Render injects $PORT (the port the service must listen on).
# The VLESS client UUID is supplied as a Render environment variable.
set -eu

: "${UUID:?environment variable UUID is required}"
: "${PORT:?environment variable PORT is required}"

sed -e "s/__PORT__/${PORT}/g" -e "s/__UUID__/${UUID}/g" \
    /etc/xray/config.template.json > /etc/xray/config.json

exec /usr/local/bin/xray run -config /etc/xray/config.json
