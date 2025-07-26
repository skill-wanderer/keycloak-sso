# Keycloak SSO with Skill-Wanderer Theme

A Docker Compose setup for running Keycloak with a custom Skill-Wanderer theme. This project provides both development (volume-mounted theme) and production (built-in theme) deployment options.

## Quick Start

### Option 1: Development with Volume Mount (Original)

1. Clone this repository:
```bash
git clone <repository-url>
cd keycloak-sso
```

2. Start the services:
```bash
docker-compose up -d
```

### Option 2: Production with Pre-built Image (Recommended)

1. Use the pre-built image from GitHub Container Registry:
```bash
# Use production compose file
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

# Or use the override file with pre-built image
docker-compose up -d
```

### Option 3: Build Custom Image Locally

1. Build the custom Keycloak image:
```bash
# On Windows (PowerShell)
.\build.ps1

# On Linux/macOS
./build.sh

# Or manually
docker build -t keycloak-skill-wanderer:latest .
```

2. Update docker-compose.override.yml to use local build and start services:
```bash
docker-compose up -d
```

## Container Registry

The project automatically builds and pushes Docker images to GitHub Container Registry:

- **Registry**: `ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer`
- **Latest**: `ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest
- **Tagged versions**: Available for each release

### Pulling the Image

```bash
# Pull the latest image
docker pull ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest

# Pull a specific version
docker pull ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest
```

## Access

- **Keycloak**: http://localhost:8080
- **Admin Console**: http://localhost:8080/admin
- **Username**: admin
- **Password**: admin

## Services

### Keycloak
- **Base Image**: quay.io/keycloak/keycloak:26.3.1
- **Custom Image**: keycloak-skill-wanderer:latest
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

### Skill-Wanderer Theme

The `skill-wanderer-theme` provides a modern, bright orange-themed login experience:

- **Location**: `themes/skill-wanderer-theme/`
- **Type**: Login theme
- **Features**: 
  - Bright orange branding (#FF6B35)
  - Modern card-based design
  - Responsive layout
  - Custom Skill-Wanderer logo
  - Accessibility features

### Development vs Production

**Development Mode** (Volume Mount):
- Theme files are mounted from `./themes/skill-wanderer-theme`
- Changes reflect after container restart
- Suitable for theme development

**Production Mode** (Built-in):
- Theme is built into the Docker image
- No external dependencies
- Faster startup and deployment
- Suitable for production environments

## Commands

### Development Commands

```bash
# Start services (development mode)
docker-compose up -d

# Stop services
docker-compose down

# Restart services
docker-compose restart

# View logs
docker-compose logs -f keycloak
```

### Production Commands

```bash
# Use pre-built image from GitHub Container Registry
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

# Build custom image locally
./build.ps1          # Windows PowerShell
./build.sh           # Linux/macOS
docker build -t keycloak-skill-wanderer:latest .  # Manual

# Start services (production mode)
docker-compose up -d

# Pull latest image from registry
docker pull ghcr.io/skill-wanderer/keycloak-sso/keycloak-skill-wanderer:latest
```

### Theme Development

```bash
# Watch theme changes (development mode only)
docker-compose restart keycloak

# Test theme changes
# 1. Edit files in themes/skill-wanderer-theme/
# 2. Restart Keycloak container
# 3. Clear browser cache
# 4. Refresh login page
```

## CI/CD Pipeline

The project includes a GitHub Actions workflow that automatically:

1. **Builds** the Docker image on every push to main/develop branches
2. **Tests** the image with security scanning
3. **Pushes** to GitHub Container Registry (ghcr.io)
4. **Tags** images based on branch/release
5. **Creates** multi-architecture builds (AMD64/ARM64)
6. **Generates** build attestations for security

### Workflow Triggers

- **Push to main/develop**: Builds and pushes with `latest` tag
- **Pull Requests**: Builds and tests (no push)
- **Releases**: Builds and pushes with version tags
- **Manual**: Can be triggered manually from GitHub Actions tab

### Available Image Tags

- `latest` - Latest build from main branch
- `main-<sha>` - Specific commit from main branch  
- `develop-<sha>` - Specific commit from develop branch
- `v1.0.0` - Release version tags
- `pr-<number>` - Pull request builds

## Configuration

### Environment Variables

Key environment variables that can be customized:

```yaml
# Keycloak Configuration
KC_HOSTNAME: localhost                    # Keycloak hostname
KC_HOSTNAME_PORT: 8080                   # Keycloak port
KC_DB_URL: jdbc:postgresql://postgres:5432/keycloak  # Database URL
KC_DB_USERNAME: keycloak                 # Database username
KC_DB_PASSWORD: keycloak                 # Database password
KEYCLOAK_ADMIN: admin                    # Admin username
KEYCLOAK_ADMIN_PASSWORD: admin           # Admin password

# PostgreSQL Configuration
POSTGRES_DB: keycloak                    # Database name
POSTGRES_USER: keycloak                  # Database username
POSTGRES_PASSWORD: keycloak              # Database password
```

### Using the Skill-Wanderer Theme

1. **Access Admin Console**: http://localhost:8080/admin
2. **Login** with admin credentials
3. **Navigate** to Realm Settings → Themes
4. **Select** "skill-wanderer-theme" for Login Theme
5. **Save** the configuration
6. **Test** by accessing a realm's login page

## File Structure

```
keycloak-sso/
├── themes/
│   ├── skill-wanderer-theme/           # Custom theme
│   │   └── login/
│   │       ├── theme.properties        # Theme configuration
│   │       ├── login.ftl              # Login page template
│   │       ├── template.ftl           # Base template
│   │       ├── README.md              # Theme documentation
│   │       └── resources/
│   │           ├── css/
│   │           │   └── custom.css     # Custom styling
│   │           └── img/               # Theme images
│   └── custom/                        # Legacy theme (deprecated)
├── docker-compose.yml                 # Base compose configuration
├── docker-compose.override.yml        # Development override  
├── docker-compose.prod.yml            # Production configuration
├── Dockerfile                         # Custom Keycloak image
├── .env.example                       # Environment variables template
├── build.sh                          # Build script (Linux/macOS)
├── build.ps1                         # Build script (Windows)
├── .dockerignore                      # Docker ignore file
├── .github/
│   └── workflows/
│       └── docker-build.yml          # GitHub Actions CI/CD
└── README.md                          # This file
```

## Troubleshooting

### Common Issues

**Theme not appearing:**
1. Verify theme files are in correct location
2. Check theme.properties configuration
3. Restart Keycloak container
4. Clear browser cache

**Database connection issues:**
1. Wait for PostgreSQL to be ready (healthcheck)
2. Check database credentials
3. Verify network connectivity

**Build failures:**
1. Ensure Docker is running
2. Check Dockerfile syntax
3. Verify theme files exist

### Logs

```bash
# View all logs
docker-compose logs -f

# View Keycloak logs only
docker-compose logs -f keycloak

# View PostgreSQL logs only
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

## Production Deployment

### Using Pre-built Image

1. **Copy environment template**:
```bash
cp .env.example .env
```

2. **Edit environment variables**:
```bash
# Update .env file with your production values
KEYCLOAK_ADMIN=your_admin_username
KEYCLOAK_ADMIN_PASSWORD=your_secure_password
POSTGRES_PASSWORD=your_secure_db_password
KC_HOSTNAME=your-domain.com
```

3. **Deploy with production configuration**:
```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

### Using Local Build

1. **Build the image locally**:
```bash
./build.ps1  # Windows
./build.sh   # Linux/macOS
```

2. **Update docker-compose.override.yml** to use local build:
```yaml
services:
  keycloak:
    build:
      context: .
      dockerfile: Dockerfile
    image: keycloak-skill-wanderer:latest
```

3. **Deploy**:
```bash
docker-compose up -d
```

## Troubleshooting

### Container Health Checks
Both services have health checks configured. You can check the status with:
```bash
# View PostgreSQL logs only
docker-compose logs -f postgres

# Check container status
docker-compose ps
```

## License

This project is licensed under the [MIT License](LICENSE).

### Branding and Trademark Policy

The open-source license for this project (found in the LICENSE file) covers the source code and does **not** grant any rights to use the trademarks, brand name, or logo of this project.

#### Project Name and Logo

The name "Skill-Wanderer" and the associated logos are trademarks of Skill-Wanderer.

#### Your Usage

You are welcome to fork, modify, and distribute the code under the terms of the MIT License. However, if you are distributing a modified version of this software, you **must**:

1.  **Use a different name and logo.** You may not use the "Skill-Wanderer" name or logo, or any confusingly similar name, to promote your version.
2.  **Remove our branding.** You must replace all of our branding assets (like logos in the UI, etc.) with your own.

Essentially, you can do whatever you want with the code, but your project must be clearly identifiable as your own and not a "duplicate" or official version of our project.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the changes
5. Submit a pull request

For theme development, please follow the existing code style and test your changes on both desktop and mobile devices.
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
