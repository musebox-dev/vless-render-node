# vless-render-node

A minimal VLESS-over-WebSocket node for Render's free Web Service tier.

## How it works

- Xray-core listens on the $PORT Render assigns, serving VLESS over
  WebSocket at path /vless.
- Render terminates TLS at its edge (https://<service>.onrender.com),
  so the container itself runs plain WebSocket.
- The client UUID is not in this repo. Set it as a Render
  environment variable named UUID.

## Deploy

1. Create a Render Web Service from this repo (Docker environment).
2. Set the environment variable UUID to a fresh UUID.
3. Deploy. The public URL is https://<service>.onrender.com.

## Client link

vless://<UUID>@<service>.onrender.com:443?encryption=none&security=tls&sni=<service>.onrender.com&type=ws&host=<service>.onrender.com&path=%2Fvless#vless-render

## Notes

- Free tier: 750 instance-hours/month, sleeps after 15 minutes idle.
  Keep it awake with an external periodic ping if you need it always on.
- Xray-core version is pinned in the Dockerfile (v26.11.9, verified).
