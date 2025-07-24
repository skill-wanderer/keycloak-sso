# Skill-Wanderer Keycloak Login Theme

This is a custom login theme for Keycloak that provides a modern bright theme with orange branding for the Skill-Wanderer platform.

## Features

- **Bright Orange Theme**: Professional bright orange background (#FF6B35) with dynamic SVG patterns
- **Skill-Wanderer Brand Colors**: Primary orange (#FF6B35) with deep orange (#E85D25) and accent yellow (#FFD93D)
- **Modern UI**: Clean white card design with subtle shadows and orange accent borders
- **Custom Logo**: Skill-Wanderer logo and branding elements
- **Responsive Design**: Works on desktop and mobile devices
- **Enhanced Form Styling**: Modern inputs with orange focus states and elegant buttons
- **Accessibility**: Proper focus states and high contrast text

## Color Palette

### Primary Brand Colors
- **Primary Orange**: `#FF6B35` - Main brand color for buttons and accents
- **Deep Orange**: `#E85D25` - Darker shade for gradients and hover effects  
- **Accent Yellow**: `#FFD93D` - Highlights and gradient combinations

### Background & UI Colors
- **Background**: `#FF6B35` with dynamic SVG gradient overlay
- **Card Background**: `#ffffff` - Clean white for the login form
- **Text Primary**: `#333` - Dark text for readability
- **Text Secondary**: `#6c757d` - Muted text for labels and placeholders

## Installation

This theme is designed to be used with Keycloak and can be:

1. **Volume mounted** in Docker containers
2. **Built into a custom Keycloak image** using the provided Dockerfile
3. **Deployed manually** to Keycloak's theme directory

## Files Structure

```
skill-wanderer-theme/
├── login/
│   ├── theme.properties      # Theme configuration
│   ├── login.ftl            # Login page template
│   ├── template.ftl         # Base template
│   └── resources/
│       ├── css/
│       │   └── custom.css   # Custom styling
│       └── img/
│           ├── cropped-skill-wanderer-logo-768x256.webp
│           ├── skill-wanderer-favicon.ico
│           ├── favicon.svg
│           └── background.svg
```

## Customization

To customize this theme:

1. **Colors**: Update the CSS variables in `custom.css`
2. **Logo**: Replace images in the `img/` directory
3. **Layout**: Modify the FreeMarker templates (`*.ftl` files)
4. **Styling**: Add custom CSS rules to `custom.css`

## Theme Properties

The theme extends the base Keycloak theme with:
- Parent: `keycloak`
- Import: `common/keycloak`
- Styles: `css/login.css css/custom.css`

## Browser Support

- Chrome/Chromium 80+
- Firefox 75+
- Safari 13+
- Edge 80+

## Development

For development and testing:

1. Mount the theme directory to `/opt/keycloak/themes/skill-wanderer-theme`
2. Restart Keycloak or clear theme cache
3. Select "skill-wanderer-theme" in realm settings

## License

This theme is part of the Skill-Wanderer platform and follows the project's licensing terms.
