FROM caddy:builder-alpine AS builder

# RUN GOTOOLCHAIN=go1.24.1 xcaddy build \

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@latest \
    --with github.com/greenpau/caddy-security-secrets-aws-secrets-manager@latest \
    --with github.com/greenpau/caddy-trace@latest \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/starskyzheng/caddy-l4
    
#    --with github.com/mholt/caddy-l4
    
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
