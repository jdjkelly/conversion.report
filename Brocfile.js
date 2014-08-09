var filterCoffeeScript = require('broccoli-coffee');
var replace = require('broccoli-replace');

var tree = replace('lib', {
  files: [
    '*.coffee' // replace only html files in src
  ],
  patterns: [
    {
      match: 'PROTOCOL',
      replacement: 'http'
    },
    {
      match: 'HOST',
      replacement: 'localhost:3000'
    }
  ]
})

module.exports = filterCoffeeScript(tree, { bare: false });
