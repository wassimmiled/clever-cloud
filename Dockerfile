FROM quay.io/keycloak/keycloak:22.0.0

# Disable HTTP mode to ensure Keycloak uses HTTPS
ENV KC_HTTP_ENABLED=false

# Set Keycloak admin credentials (configure securely in Clever Cloud)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Set external hostname for Keycloak (your Clever Cloud URL)
ENV KC_HOSTNAME=lwgjycyjutwlipojbrzi-keycloak.services.clever-cloud.com

# Improve performance by configuring database connection pooling
ENV KC_DB_POOL_INITIAL_SIZE=5
ENV KC_DB_POOL_MAX_SIZE=25

# Use Java 21 explicitly
ENV CC_JAVA_VERSION=21

# Enable proxy mode for reverse proxy compatibility
ENV KC_PROXY=edge
ENV KC_PROXY_ADDRESS_FORWARDING=true

# Disable theme caching for development
ENV KC_SPI_THEME_CACHE_TEMPLATES=false
ENV KC_SPI_THEME_CACHE_THEMES=false
ENV KC_SPI_THEME_STATIC_MAX_AGE=-1

# Set Keycloak to use the default theme
ENV KC_SPI_THEME_DEFAULT=keycloak

# Copy the custom Keycloakify theme JAR
COPY keycloakify-starter-keycloak-theme-4.8.2.jar /opt/keycloak/providers/

# Build Keycloak with the custom theme
RUN /opt/keycloak/bin/kc.sh build

# Set response headers to allow iframe embedding and set static cache options
ENV KC_HTTP_RESPONSE_HEADERS="strict-transport-security=max-age=31536000;includeSubDomains, x-frame-options=ALLOWALL, content-security-policy=frame-ancestors 'self' https://lwgjycyjutwlipojbrzi-keycloak.services.clever-cloud.com"
ENV KC_SPI_THEME_STATIC_MAX_AGE=0
ENV KC_SPI_THEME_CACHE_TTL=0

# Ensure Keycloak runs in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
