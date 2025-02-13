FROM keycloak/keycloak:26.0.7-0

# Disable HTTP mode to ensure Keycloak uses HTTPS
ENV KC_HTTP_ENABLED=false

# Set admin credentials (configure securely in Clever Cloud)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Set external hostname for Keycloak (your Clever Cloud URL)
ENV KC_HOSTNAME=app-113b515e-dc1e-412b-afff-57b43ba3e238.cleverapps.io

# Set response headers to allow iframe embedding from Clever Cloud URL and set static cache options
ENV KC_HTTP_RESPONSE_HEADERS="strict-transport-security=max-age=31536000;includeSubDomains, x-frame-options=ALLOWALL, content-security-policy=frame-ancestors 'self' https://app-113b515e-dc1e-412b-afff-57b43ba3e238.cleverapps.io"

# Ensure Keycloak runs in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
