FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v1.1.18 \
    --with github.com/caddy-dns/cloudflare@v0.2.2 \
    --with github.com/enum-gg/caddy-discord@v1.2.1

FROM caddy:2.10.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
