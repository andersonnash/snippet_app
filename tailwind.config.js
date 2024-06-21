// tailwind.config.js
module.exports = {
  darkMode: 'media', // or 'class' for class-based dark mode
  content: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
    './app/assets/stylesheets/**/*.scss',
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      colors: {
        light: {
          background: '#f5f7fa',
          text: '#1a202c',
        },
        dark: {
          background: '#1a202c',
          text: '#a0aec0',
        },
      },
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}
