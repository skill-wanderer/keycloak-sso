/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./themes/**/*.ftl",
    "./themes/**/*.html",
  ],
  theme: {
    extend: {
      colors: {
        // Skill-Wanderer (dark/orange)
        'brand': {
          50: '#fff7ed',
          100: '#ffedd5',
          200: '#fed7aa',
          300: '#fdba74',
          400: '#fb923c',
          500: '#FF6B35',
          600: '#E85D25',
          700: '#D04A1A',
          800: '#9a3412',
          900: '#7c2d12',
        },
        'dark': {
          bg: '#1a1a1a',
          deeper: '#0f0f0f',
          card: 'rgba(255, 255, 255, 0.05)',
          'card-hover': 'rgba(255, 255, 255, 0.08)',
        },
        'accent-yellow': '#FFD93D',
        'success-green': '#4CAF50',
        'failure-red': '#f44336',
        // Chanh Dao (warm/gold)
        'cd': {
          brand: '#D4AF37',
          accent: '#B8860B',
          'gold-light': '#E8C547',
          bg: '#FCF8ED',
          'bg-alt': '#F5EDD6',
          card: 'rgba(212, 175, 55, 0.06)',
          'card-hover': 'rgba(212, 175, 55, 0.12)',
          primary: '#3E2F1B',
          secondary: '#6B5B3E',
          muted: '#8B7B5E',
          light: '#A89672',
          success: '#4CAF50',
          failure: '#f44336',
          wisdom: '#9C27B0',
          growth: '#2196F3',
          premium: '#D4AF37',
          border: 'rgba(212, 175, 55, 0.15)',
          'surface-alt': '#F5EDD6',
        },
      },
      fontFamily: {
        sans: ['Inter', 'Roboto', 'Lexend', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'sans-serif'],
        serif: ['Lora', 'Crimson Text', 'Playfair Display', 'Georgia', 'serif'],
      },
      animation: {
        'fade-in': 'fadeIn 0.6s ease-out',
        'spin-slow': 'spin 1s linear infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0', transform: 'translateY(30px) scale(0.98)' },
          '100%': { opacity: '1', transform: 'translateY(0) scale(1)' },
        },
      },
      boxShadow: {
        // Skill-Wanderer shadows
        'card': '0 20px 40px rgba(0, 0, 0, 0.3)',
        'card-hover': '0 25px 50px rgba(0, 0, 0, 0.5)',
        'brand-glow': '0 4px 15px rgba(255, 107, 53, 0.3)',
        'brand-glow-lg': '0 8px 25px rgba(255, 107, 53, 0.4)',
        // Chanh Dao shadows
        'cd-brand': '0 4px 15px rgba(212, 175, 55, 0.2)',
        'cd-brand-lg': '0 6px 25px rgba(212, 175, 55, 0.35)',
        'cd-card': '0 2px 12px rgba(62, 47, 27, 0.08)',
        'cd-dropdown': '0 12px 32px rgba(62, 47, 27, 0.15)',
      },
    },
  },
  plugins: [],
}
