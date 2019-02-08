const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

module: {
  rules: [
    {
      test: /\.js(\.erb)?$/,
      exclude: /node_modules/,
      loader: 'babel-loader',
      options: {
        presets: [
          ['env', { modules: false }]
        ]
      }
    },
  ]
}

environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader',
  options: {
    attempts: 1
  }
});

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery"
  })
);

module.exports = environment
