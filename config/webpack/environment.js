const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

// `node_modules`からの依存関係を正しく解決できるようにする
environment.config.merge({
  resolve: {
    modules: [
      'node_modules'
    ]
  }
})

module.exports = environment