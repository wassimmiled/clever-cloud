FROM quay.io/keycloak/keycloak:22.0.5


# Run Keycloak in production mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]