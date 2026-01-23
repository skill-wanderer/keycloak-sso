/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./themes/**/*.ftl",
    "./themes/**/*.html",
  ],
  theme: {
    extend: {
      colors: {
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
      },
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'sans-serif'],
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
        'card': '0 20px 40px rgba(0, 0, 0, 0.1)',
        'card-hover': '0 25px 50px rgba(0, 0, 0, 0.15)',
      },
    },
  },
  plugins: [],
}
