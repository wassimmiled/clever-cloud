FROM quay.io/keycloak/keycloak:22.0.0

# Set the external hostname for Keycloak (replace with your Clever Cloud app URL)
ENV KC_HOSTNAME=app-113b515e-dc1e-412b-afff-57b43ba3e238.cleverapps.io

# Enable HTTP mode (required for Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials (configure securely in Clever Cloud)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Enable proxy mode for reverse proxy compatibility
ENV KC_PROXY=edge
ENV KC_PROXY_ADDRESS_FORWARDING=true

# Set Keycloak to use the default theme (make sure the JAR is properly loaded)
ENV KC_SPI_THEME_DEFAULT=keycloak

# Copy the custom Keycloakify theme JAR
COPY keycloakify-starter-keycloak-theme-4.8.2.jar /opt/keycloak/providers/

# Build Keycloak with the custom theme
RUN /opt/keycloak/bin/kc.sh build

# Set response headers to allow iframe embedding and set static cache options
ENV KC_HTTP_RESPONSE_HEADERS="strict-transport-security=max-age=31536000;includeSubDomains, x-frame-options=ALLOWALL, content-security-policy=frame-ancestors *"
ENV KC_SPI_THEME_STATIC_MAX_AGE=0
ENV KC_SPI_THEME_CACHE_TTL=0

# Disable HTTP mode to ensure Keycloak uses HTTPS
ENV KC_HTTP_ENABLED=false

# Ensure Keycloak runs in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
