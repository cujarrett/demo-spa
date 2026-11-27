FROM ghcr.io/cujarrett/base-nginx:1.31-alpine@sha256:8a5df7fb081bbe170c362303c899a10ee94046a6ccb3a55783336ad87fd218e6
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
