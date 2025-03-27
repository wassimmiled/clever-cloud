FROM quay.io/keycloak/keycloak:22.0.0

# Enable HTTP mode (required for Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=c3ccVBb76Ai2M6

# Configure database (PostgreSQL)
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://b9fmc864f0apbfflig2s-postgresql.services.clever-cloud.com:5998/b9fmc864f0apbfflig2s
ENV KC_DB_USERNAME=uh6fpccresqmfqstouyq
ENV KC_DB_PASSWORD=B1ZlXFJbhmfyBdu9XSGr
ENV KC_DB_SCHEMA=public

# Set correct hostname for Keycloak
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

# Enable proxy mode for Clever Cloud
ENV KC_PROXY=edge
ENV KC_PROXY_ADDRESS_FORWARDING=true

# Ensure Keycloak runs in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
