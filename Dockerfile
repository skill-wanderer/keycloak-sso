# Multi-stage Dockerfile for Keycloak with Skill-Wanderer custom theme
FROM quay.io/keycloak/keycloak:26.3.1 as builder

# Build arguments for metadata
ARG BUILDTIME
ARG VERSION
ARG REVISION

# Set environment variables for the build
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

# Build Keycloak optimized for production
RUN /opt/keycloak/bin/kc.sh build

# Production stage
FROM quay.io/keycloak/keycloak:26.3.1

# Build arguments for metadata
ARG BUILDTIME
ARG VERSION  
ARG REVISION

# Add metadata labels
LABEL org.opencontainers.image.created="${BUILDTIME}"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.revision="${REVISION}"
LABEL org.opencontainers.image.title="Keycloak with Skill-Wanderer Theme"
LABEL org.opencontainers.image.description="Custom Keycloak image with Skill-Wanderer branding and theme"
LABEL org.opencontainers.image.vendor="Skill-Wanderer"
LABEL org.opencontainers.image.authors="Skill-Wanderer Team"
LABEL org.opencontainers.image.url="https://github.com/skill-wanderer/keycloak-sso"
LABEL org.opencontainers.image.source="https://github.com/skill-wanderer/keycloak-sso"
LABEL org.opencontainers.image.licenses="MIT"

# Copy the optimized Keycloak build from builder stage
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Copy the custom Skill-Wanderer theme
COPY themes/skill-wanderer-theme /opt/keycloak/themes/skill-wanderer-theme

# Create keycloak user and set permissions
USER 0
RUN chown -R 1000:1000 /opt/keycloak/themes/skill-wanderer-theme
USER 1000

# Set working directory
WORKDIR /opt/keycloak

# Set environment variables for runtime
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Expose ports
EXPOSE 8080
EXPOSE 8443

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/health/ready || exit 1

# Default entrypoint
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
