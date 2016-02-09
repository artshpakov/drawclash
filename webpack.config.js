module.exports = {

  entry: './app/assets/javascripts/application.jsx',

  output: {
    filename: './public/js/main.js'
  },

  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee" },
      { test: /\.sass$/, loaders: ["style", "css", "sass"] },
      { test: /\.jsx?$/, loader: 'babel', query: {presets: ['react', 'es2015']} }
    ]
  },
  resolve: {
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }

}
