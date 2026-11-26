FROM ghcr.io/cujarrett/base-nginx:1.31-alpine@sha256:b7012eeaf6e201aba6a2de70c5b9d8d23a368e5c4ce1534b64240e39b8b81d16
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
