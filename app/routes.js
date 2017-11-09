
var path = require('path');
var glob = require('glob');
var app = require(path.join(process.cwd(), 'app'));

var controllers = {};
var files = glob.sync(path.join(process.cwd(), 'app', 'controllers', '**', '*.js'));
files.forEach(function(file) {
  var temp = controllers;
  var parts = path.relative(path.join(process.cwd(), 'app', 'controllers'), file).slice(0, -3).split(path.sep);

  while (parts.length) {
    if (parts.length === 1) {
      temp[parts[0]] = require(file);
    } else {
      temp[parts[0]] = temp[parts[0]] || {};
    }
    temp = temp[parts.shift()];
  }
});

// Rutas de la aplicación
module.exports = function(){
  //Rutas index
  console.log('Hasta aqui bien')
  require('./routes/index')(app, controllers);
}