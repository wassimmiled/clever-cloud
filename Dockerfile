# Use official Keycloak image
FROM quay.io/keycloak/keycloak:22.0.0 

# Enable HTTP mode (required for Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials (⚠️ Change for production)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Configure PostgreSQL database connection
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://b9fmc864f0apbfflig2s-postgresql.services.clever-cloud.com:5998/b9fmc864f0apbfflig2s
ENV KC_DB_USERNAME=uh6fpccresqmfqstouyq
ENV KC_DB_PASSWORD=B1ZlXFJbhmfyBdu9XSGr
ENV KC_DB_SCHEMA=public

# Set Clever Cloud hostname (⚠️ Replace with your actual domain)
ENV KC_HOSTNAME=your-clever-cloud-keycloak-url
ENV KC_HOSTNAME_ADMIN=your-clever-cloud-keycloak-url

# Ensure hostname strict mode is disabled (or enable if using HTTPS)
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

# Enable proxy mode for Clever Cloud
ENV KC_PROXY=edge
ENV KC_PROXY_ADDRESS_FORWARDING=true

# Copy the custom Keycloakify theme JAR (Ensure file exists before deployment)
COPY keycloakify-starter-keycloak-theme-4.8.2.jar /opt/keycloak/providers/

# Ensure Keycloak runs in development mode & auto-builds
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--auto-build", "--http-port=${PORT}"]
