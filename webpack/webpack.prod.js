const webpackMerge = require("webpack-merge");
const commonConfig = require("./webpack.common.js");
const path = require("path");
const compressionPlugin = require("compression-webpack-plugin");

const ROOT = path.resolve(__dirname, "../");
const BUILD_DIR = path.resolve(__dirname, "../dist");

module.exports = webpackMerge(commonConfig, {
  mode: "production",

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: [
          {
            loader: "elm-webpack-loader",
            options: { verbose: true, optimize: true, cwd: ROOT },
          },
        ],
      },
    ],
  },

  output: {
    path: BUILD_DIR,
    filename: "app.[hash].bundle.js",
  },

  plugins: [new compressionPlugin()],
});
