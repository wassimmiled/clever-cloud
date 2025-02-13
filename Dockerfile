FROM quay.io/keycloak/keycloak:22.0.0
# Enable HTTP mode (required in Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials (change these securely in Clever Cloud ENV)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Start Keycloak in development mode (embedded H2 DB)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
