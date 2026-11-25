FROM ghcr.io/cujarrett/base-nginx:1.31-alpine@sha256:fcaa2759ec56a2e5c5d0a3725274a52f4e233aa3ff8c6d25003422b0aa1e57aa
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
