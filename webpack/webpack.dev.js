const webpackMerge = require("webpack-merge");
const commonConfig = require("./webpack.common.js");
const path = require("path");

const ROOT = path.resolve(__dirname, "../");

module.exports = env =>
  webpackMerge(commonConfig, {
    mode: "development",

    devtool: "eval",

    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: [
            { loader: "elm-hot-webpack-loader" },
            {
              loader: "elm-webpack-loader",
              options: {
                verbose: true,
                cwd: ROOT,
                debug: env == "debug"
              }
            }
          ]
        }
      ]
    },

    output: {
      filename: "app.bundle.js"
    }
  });
