module.exports = {
  purge: [
    "./app/**/*.html.haml",
    "./app/components/*.html.haml",
    "./app/components/*.rb",
    "./app/javascript/styles/**/*.css",
    "./app/javascript/controllers/**/*.js"
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        brand: '#eb7923',
        chocolate: {
          '50':  '#fcfaf6',
          '100': '#faf0cb',
          '200': '#f4d999',
          '300': '#e3b265',
          '400': '#cf863b',
          '500': '#b56520',
          '600': '#984b15',
          '700': '#743812',
          '800': '#50270e',
          '900': '#34180a',
        },
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
