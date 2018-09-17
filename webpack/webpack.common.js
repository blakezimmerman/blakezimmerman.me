const HtmlWebpackPlugin = require("html-webpack-plugin");
const path = require("path");

const ROOT = path.resolve(__dirname, "../src");

module.exports = {
  entry: path.resolve(ROOT, "./js/index.js"),

  resolve: {
    extensions: [".js", ".elm"],
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/env"],
          },
        },
      },
      {
        test: /\.(pdf|png|jpe?g|gif|svg|woff|woff2|ttf|eot|ico)$/,
        use: "file-loader?name=assets/[name].[ext]",
      },
    ],
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: "index.html",
    }),
  ],

  target: "web",
};
