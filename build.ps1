# Build script for Keycloak with Skill-Wanderer theme (PowerShell)

Write-Host "Building Keycloak with Skill-Wanderer theme..." -ForegroundColor Green

# Build the Docker image
docker build -t keycloak-skill-wanderer:latest .

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Successfully built keycloak-skill-wanderer:latest" -ForegroundColor Green
    
    # Also tag for GitHub Container Registry
    docker tag keycloak-skill-wanderer:latest ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest
    
    Write-Host ""
    Write-Host "🏷️  Image tagged as:" -ForegroundColor Yellow
    Write-Host "  - keycloak-skill-wanderer:latest" -ForegroundColor White
    Write-Host "  - ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest" -ForegroundColor White
    Write-Host ""
    Write-Host "To run with docker-compose:" -ForegroundColor Yellow
    Write-Host "  docker-compose up -d" -ForegroundColor White
    Write-Host ""
    Write-Host "To run the image directly:" -ForegroundColor Yellow
    Write-Host "  docker run -p 8080:8080 \" -ForegroundColor White
    Write-Host "    -e KEYCLOAK_ADMIN=admin \" -ForegroundColor White
    Write-Host "    -e KEYCLOAK_ADMIN_PASSWORD=admin \" -ForegroundColor White
    Write-Host "    keycloak-skill-wanderer:latest start-dev" -ForegroundColor White
    Write-Host ""
    Write-Host "To push to GitHub Container Registry (requires authentication):" -ForegroundColor Yellow
    Write-Host "  docker push ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest" -ForegroundColor White
    Write-Host ""
    Write-Host "Access Keycloak at: http://localhost:8080" -ForegroundColor Cyan
    Write-Host "Admin console: http://localhost:8080/admin" -ForegroundColor Cyan
    Write-Host "Login: admin / admin" -ForegroundColor Cyan
} else {
    Write-Host "❌ Build failed" -ForegroundColor Red
    exit 1
}
