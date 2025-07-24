# Changelog

All notable changes to the Keycloak Skill-Wanderer project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- GitHub Actions CI/CD pipeline for automated builds
- Multi-architecture Docker builds (AMD64/ARM64)
- GitHub Container Registry integration
- Production deployment configuration
- Security scanning with Docker Scout
- Build attestations for supply chain security
- Automated README updates with latest image tags

### Changed
- Renamed theme from "custom" to "skill-wanderer-theme"
- Updated Dockerfile with multi-stage build and metadata labels
- Enhanced docker-compose configuration with production overrides
- Improved documentation with CI/CD information

### Fixed
- CSS lint errors in theme files
- Docker build optimization with .dockerignore

## [1.0.0] - 2025-07-24

### Added
- Initial Keycloak SSO setup with Docker Compose
- Custom Skill-Wanderer theme with bright orange branding
- PostgreSQL database integration
- Health checks for all services
- Development and production deployment options
- Custom login page with Skill-Wanderer logo
- Responsive design for mobile and desktop
- Documentation and build scripts

### Features
- Modern bright orange theme (#FF6B35)
- Custom Skill-Wanderer branding and logo
- Professional card-based login layout
- Accessibility features and focus states
- Smooth animations and transitions
- Font Awesome icon integration
- Cross-browser compatibility
