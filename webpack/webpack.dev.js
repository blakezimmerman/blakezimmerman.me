const webpackMerge = require('webpack-merge');
const commonConfig = require('./webpack.common.js');

module.exports = webpackMerge(commonConfig, {
  devtool: 'source-map',

  module: {
    loaders : [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/, /Stylesheets\.elm/],
        use: [
          'elm-hot-loader',
          {
            loader: 'elm-webpack-loader',
            options: {
                verbose: true,
                warn: true,
                debug: true
            }
          }
        ]
      }
    ]
  },

  output: {
    filename: 'app.bundle.js'
  }
});
