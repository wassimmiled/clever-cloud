FROM quay.io/keycloak/keycloak:22.0.0

# Enable HTTP mode (required for Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials (configure securely in Clever Cloud)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Copy the custom Keycloakify theme JAR
COPY keycloakify-starter-keycloak-theme-4.8.2.jar /opt/keycloak/providers/

# Build Keycloak with the custom theme
RUN /opt/keycloak/bin/kc.sh build

# Override default Content Security Policy to allow embedding
ENV KC_SPI_THEME_DEFAULT=keycloak
ENV KC_SPI_THEME_STATIC_MAX_AGE=0
ENV KC_SPI_THEME_CACHE_TTL=0

# Set response headers to allow iframe embedding
ENV KC_HTTP_RESPONSE_HEADERS="strict-transport-security=max-age=31536000;includeSubDomains, x-frame-options=ALLOWALL, content-security-policy=frame-ancestors *"

# Start Keycloak in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
