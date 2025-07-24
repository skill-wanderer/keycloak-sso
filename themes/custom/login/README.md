# Custom Keycloak Login Theme - Dark Orange Brand

This is a custom login theme for Keycloak that provides a modern dark theme with orange-yellow gradient branding.

## Features

- **Dark Theme**: Professional dark background (#1a1a1a) with darker sections (#0f0f0f)
- **Orange Brand Colors**: Primary orange (#FF6B35) with deep orange (#E85D25) and accent yellow (#FFD93D)
- **Modern UI**: Glass-morphism effect with backdrop blur and orange accent borders
- **Custom Favicon**: SVG-based icon with orange gradient colors
- **Responsive Design**: Works on desktop and mobile devices
- **Enhanced Form Styling**: Dark inputs with orange focus states and gradient buttons
- **Accessibility**: Proper focus states and high contrast text

## Color Palette

### Primary Brand Colors
- **Primary Orange**: `#FF6B35` - Main brand color for buttons and accents
- **Deep Orange**: `#E85D25` - Darker shade for gradients and hover effects  
- **Accent Yellow**: `#FFD93D` - Highlights and gradient combinations

### Background Colors
- **Dark Background**: `#1a1a1a` - Main page background
- **Darker Background**: `#0f0f0f` - Section backgrounds for contrast
- **Light Text**: `#e0e0e0` - Primary text color

### UI Element Colors
- **Card Background**: `rgba(255, 255, 255, 0.05)` - Semi-transparent for glass effect
- **Card Hover**: `rgba(255, 255, 255, 0.08)` - Slightly more opaque on hover
- **Success Green**: `#4CAF50` - For success messages
- **Error Red**: Enhanced red tones for error states

## Files Structure

```
themes/custom/login/
├── theme.properties          # Theme configuration
├── template.ftl             # Main template with custom favicon
├── login.ftl               # Login page template
└── resources/
    ├── css/
    │   └── custom.css      # Custom styles
    └── img/
        ├── favicon.svg     # Custom favicon
        └── background.svg  # Background pattern
```

## Theme Configuration

The theme extends the base Keycloak theme and adds custom styling:

- **Parent Theme**: keycloak
- **Imports**: common/keycloak
- **Custom Styles**: login.css, custom.css

## Visual Changes

## Visual Changes

### Colors
- **Primary Gradient**: Orange to yellow (`#FF6B35` → `#E85D25` → `#FFD93D`)
- **Background**: Dark theme with subtle orange accents
- **Text Colors**: Light gray (`#e0e0e0`) for excellent readability on dark background
- **Accent Colors**: Orange gradient for buttons, yellow for links and highlights

### Layout
- **Centered Design**: Login card is centered both horizontally and vertically
- **Glass Effect**: Semi-transparent dark background with orange border accent
- **Rounded Corners**: 15px border radius on the main card
- **Enhanced Shadows**: Dark shadows with orange glow for depth
- **Animation**: Smooth card entrance animation

### Interactive Elements
- **Button Hover**: Lift effect with enhanced orange glow
- **Input Focus**: Orange border with subtle glow effect
- **Gradient Text**: Brand title uses orange-to-yellow gradient
- **Responsive**: Adapts to mobile screens with proper spacing

## Testing with Docker

1. Start the Docker Compose setup:
```bash
docker-compose up -d
```

2. Wait for Keycloak to start (check logs):
```bash
docker-compose logs -f keycloak
```

3. Access Keycloak Admin Console:
   - URL: http://localhost:8080/admin
   - Username: admin
   - Password: admin

4. Apply the custom theme:
   - Go to **Realm Settings** → **Themes**
   - Set **Login Theme** to `custom`
   - Click **Save**

5. Test the login page:
   - Go to http://localhost:8080/realms/master/account
   - You'll be redirected to the custom login page

## Customization

To modify the theme:

1. **Colors**: Edit the CSS variables in `custom.css`
2. **Background**: Replace `background.svg` with your own image
3. **Favicon**: Replace `favicon.svg` with your own icon
4. **Layout**: Modify the template files or CSS

After making changes, restart the Keycloak container:
```bash
docker-compose restart keycloak
```

## Browser Support

The theme uses modern CSS features with fallbacks:
- **Backdrop Filter**: Supported in modern browsers with `-webkit-` prefix for Safari
- **CSS Grid/Flexbox**: For responsive layout
- **CSS Variables**: For easy customization (fallback colors provided)

## Troubleshooting

### Theme Not Loading
1. Check that files are in the correct directory structure
2. Verify `theme.properties` configuration
3. Restart Keycloak container
4. Check Keycloak logs for theme-related errors

### Styling Issues
1. Clear browser cache
2. Check CSS syntax in `custom.css`
3. Verify file paths in CSS (relative to resources directory)

### Favicon Not Showing
1. Ensure `favicon.svg` exists in `resources/img/`
2. Check browser cache (hard refresh: Ctrl+F5)
3. Verify the favicon reference in `template.ftl`
