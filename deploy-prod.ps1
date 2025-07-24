# Production deployment script for Keycloak Skill-Wanderer (PowerShell)

Write-Host "🚀 Deploying Keycloak Skill-Wanderer in Production Mode" -ForegroundColor Green

# Check if .env file exists
if (-not (Test-Path ".env")) {
    Write-Host "📝 Creating .env file from template..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "⚠️  Please edit .env file with your production values before continuing!" -ForegroundColor Yellow
    Write-Host "   - Update KEYCLOAK_ADMIN_PASSWORD" -ForegroundColor White
    Write-Host "   - Update POSTGRES_PASSWORD" -ForegroundColor White
    Write-Host "   - Update KC_HOSTNAME" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to continue after editing .env file"
}

# Pull the latest image
Write-Host "📦 Pulling latest image from GitHub Container Registry..." -ForegroundColor Blue
docker pull ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to pull image" -ForegroundColor Red
    exit 1
}

# Deploy with production configuration
Write-Host "🔧 Starting services with production configuration..." -ForegroundColor Blue
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to start services" -ForegroundColor Red
    exit 1
}

# Wait for services to be healthy
Write-Host "⏳ Waiting for services to be healthy..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Check health status
Write-Host "🏥 Checking service health..." -ForegroundColor Blue
docker-compose -f docker-compose.yml -f docker-compose.prod.yml ps

# Display access information
Write-Host ""
Write-Host "✅ Deployment completed!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Access Keycloak at: http://localhost:8080" -ForegroundColor Cyan
Write-Host "🔧 Admin console: http://localhost:8080/admin" -ForegroundColor Cyan
Write-Host "📊 Health check: http://localhost:8080/health" -ForegroundColor Cyan
Write-Host ""
Write-Host "📝 To view logs: docker-compose logs -f keycloak" -ForegroundColor White
Write-Host "🛑 To stop: docker-compose down" -ForegroundColor White
Write-Host ""
Write-Host "⚠️  Remember to:" -ForegroundColor Yellow
Write-Host "   - Configure your realm to use 'skill-wanderer-theme'" -ForegroundColor White
Write-Host "   - Set up proper SSL certificates for production" -ForegroundColor White
Write-Host "   - Update firewall rules if needed" -ForegroundColor White
