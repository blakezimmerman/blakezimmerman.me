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
      },
      {
        test: /\.(pdf|png|jpe?g|gif|svg|woff|woff2|ttf|eot|ico)$/,
        use: 'file-loader?name=assets/[name].[ext]'
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
