const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

const ROOT = path.resolve(__dirname, '../');

module.exports = {
  entry: path.resolve(ROOT, './index.js'),

  resolve: {
    extensions: ['.js', '.elm'],
  },

  module: {
    loaders : [
      {
        test: /Stylesheets\.elm$/,
        use: [
          'style-loader',
          'css-loader',
          'elm-css-webpack-loader'
        ]
      }
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'index.html'
    })
  ],

  target: 'web'
};
