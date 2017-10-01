const webpackMerge = require('webpack-merge');
const commonConfig = require('./webpack.common.js');
const path = require('path');

const ROOT = path.resolve(__dirname, '../');

module.exports = env => webpackMerge(commonConfig, {
  devtool: 'eval',

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
                cwd: ROOT,
                debug: env == 'debug'
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
