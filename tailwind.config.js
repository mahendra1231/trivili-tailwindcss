/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './index.html',
    './dist/pages/**/*.{html,js}',
    './booking.html',
    './js/**/*.js'
  ],
  theme: {
    container: {
      center: true,
      padding: '16px',
    },
    extend: {
      colors: {
        primary: '#1e3a8a',
        dark: '#000000CC',
        secondary: '#bdb76b',
      },
      screens: {
        'hp': '375px',
        'tablet': '640px',
        'desktop': '1024px',
        '2xl': '1320px',
      },
    },
  },
  plugins: [],
};
