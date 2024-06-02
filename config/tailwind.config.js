module.exports = {
  darkMode: 'media', // or 'media' for media-query based dark mode
  content: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
    './app/assets/stylesheets/**/*.scss',
    "./node_modules/flowbite/**/*.js"
  ],
  plugins: [
    require('flowbite/plugin')
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
  plugins: [],
}
