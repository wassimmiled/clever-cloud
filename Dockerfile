FROM quay.io/keycloak/keycloak:22.0.0

# Enable HTTP mode (required for Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials (configure securely in Clever Cloud)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Set database URL (use default H2 or configure to use external DB)
# Make sure to configure the proper DB URL if needed
# For example:
# ENV KC_DB=postgres
# ENV KC_DB_URL=jdbc:postgresql://<host>:<port>/<db_name>
# ENV KC_DB_USERNAME=<username>
# ENV KC_DB_PASSWORD=<password>

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

# Ensure Keycloak runs in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
