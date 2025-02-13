FROM keycloak/keycloak:26.0.7-0

# Enable HTTP mode (required for Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials (configure securely in Clever Cloud)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin



# Ensure Keycloak runs in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
