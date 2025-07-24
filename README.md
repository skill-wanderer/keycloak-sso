# Keycloak SSO

A Docker Compose setup for running Keycloak locally with custom themes.

## Quick Start

1. Clone this repository:
```bash
git clone <repository-url>
cd keycloak-sso
```

2. Start the services:
```bash
docker-compose up -d
```

3. Access Keycloak:
   - **URL**: http://localhost:8080
   - **Admin Console**: http://localhost:8080/admin
   - **Username**: admin
   - **Password**: admin

## Services

### Keycloak
- **Image**: quay.io/keycloak/keycloak:26.3.1
- **Port**: 8080
- **Admin Console**: http://localhost:8080/admin
- **Health Check**: http://localhost:8080/health

### PostgreSQL Database
- **Image**: postgres:15
- **Port**: 5432
- **Database**: keycloak
- **Username**: keycloak
- **Password**: keycloak

## Custom Themes

Custom themes are located in the `themes/` directory and are automatically mounted to Keycloak's themes directory. Any changes to theme files will be reflected after restarting the Keycloak container.

## Commands

### Start services
```bash
docker-compose up -d
```

### Stop services
```bash
docker-compose down
```

### View logs
```bash
# All services
docker-compose logs -f

# Keycloak only
docker-compose logs -f keycloak

# PostgreSQL only
docker-compose logs -f postgres
```

### Restart Keycloak (useful after theme changes)
```bash
docker-compose restart keycloak
```

### Clean up (remove containers and volumes)
```bash
docker-compose down -v
```

## Configuration

Environment variables can be customized in the `.env` file:

- `KEYCLOAK_ADMIN`: Admin username (default: admin)
- `KEYCLOAK_ADMIN_PASSWORD`: Admin password (default: admin)
- `KEYCLOAK_PORT`: Keycloak port (default: 8080)
- `POSTGRES_DB`: Database name (default: keycloak)
- `POSTGRES_USER`: Database username (default: keycloak)
- `POSTGRES_PASSWORD`: Database password (default: keycloak)

## Development Mode

The Keycloak container runs in development mode (`start-dev`) which:
- Enables HTTP (non-HTTPS) connections
- Disables hostname strict checking
- Enables health and metrics endpoints
- Provides more verbose logging

For production use, you should switch to production mode and configure proper SSL certificates.

## Troubleshooting

### Container Health Checks
Both services have health checks configured. You can check the status with:
```bash
docker-compose ps
```

### Database Connection Issues
If Keycloak fails to connect to the database, ensure PostgreSQL is fully started:
```bash
docker-compose logs postgres
```

### Theme Issues
If custom themes are not loading:
1. Ensure theme files are in the correct directory structure
2. Restart the Keycloak container: `docker-compose restart keycloak`
3. Check Keycloak logs for theme-related errors