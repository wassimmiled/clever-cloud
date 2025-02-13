# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:22.0.0

# Set environment variables for Keycloak admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=your-secure-password

# Expose the default port for Keycloak
EXPOSE 8080

# Run Keycloak with the necessary parameters
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]

# Default command (Clever Cloud will use this to start the app)
CMD ["start"]
