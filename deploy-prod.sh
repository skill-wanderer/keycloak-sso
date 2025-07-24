#!/bin/bash

# Production deployment script for Keycloak Skill-Wanderer

set -e

echo "🚀 Deploying Keycloak Skill-Wanderer in Production Mode"

# Check if .env file exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "⚠️  Please edit .env file with your production values before continuing!"
    echo "   - Update KEYCLOAK_ADMIN_PASSWORD"
    echo "   - Update POSTGRES_PASSWORD"
    echo "   - Update KC_HOSTNAME"
    echo ""
    read -p "Press Enter to continue after editing .env file..."
fi

# Pull the latest image
echo "📦 Pulling latest image from GitHub Container Registry..."
docker pull ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest

# Deploy with production configuration
echo "🔧 Starting services with production configuration..."
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

# Wait for services to be healthy
echo "⏳ Waiting for services to be healthy..."
sleep 10

# Check health status
echo "🏥 Checking service health..."
docker-compose -f docker-compose.yml -f docker-compose.prod.yml ps

# Display access information
echo ""
echo "✅ Deployment completed!"
echo ""
echo "🌐 Access Keycloak at: http://localhost:8080"
echo "🔧 Admin console: http://localhost:8080/admin"
echo "📊 Health check: http://localhost:8080/health"
echo ""
echo "📝 To view logs: docker-compose logs -f keycloak"
echo "🛑 To stop: docker-compose down"
echo ""
echo "⚠️  Remember to:"
echo "   - Configure your realm to use 'skill-wanderer-theme'"
echo "   - Set up proper SSL certificates for production"
echo "   - Update firewall rules if needed"
