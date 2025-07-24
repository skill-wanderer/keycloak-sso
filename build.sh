#!/bin/bash

# Build script for Keycloak with Skill-Wanderer theme

echo "Building Keycloak with Skill-Wanderer theme..."

# Build the Docker image
docker build -t keycloak-skill-wanderer:latest .

if [ $? -eq 0 ]; then
    echo "✅ Successfully built keycloak-skill-wanderer:latest"
    
    # Also tag for GitHub Container Registry
    docker tag keycloak-skill-wanderer:latest ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest
    
    echo ""
    echo "🏷️  Image tagged as:"
    echo "  - keycloak-skill-wanderer:latest"
    echo "  - ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest"
    echo ""
    echo "To run with docker-compose:"
    echo "  docker-compose up -d"
    echo ""
    echo "To run the image directly:"
    echo "  docker run -p 8080:8080 \\"
    echo "    -e KEYCLOAK_ADMIN=admin \\"
    echo "    -e KEYCLOAK_ADMIN_PASSWORD=admin \\"
    echo "    keycloak-skill-wanderer:latest start-dev"
    echo ""
    echo "To push to GitHub Container Registry (requires authentication):"
    echo "  docker push ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest"
    echo ""
    echo "Access Keycloak at: http://localhost:8080"
    echo "Admin console: http://localhost:8080/admin"
    echo "Login: admin / admin"
else
    echo "❌ Build failed"
    exit 1
fi
