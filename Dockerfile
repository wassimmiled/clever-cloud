FROM quay.io/keycloak/keycloak:22.0.0

# Set Keycloak to use PostgreSQL
ENV KC_DB=postgres
ENV KC_HTTP_ENABLED=true

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
