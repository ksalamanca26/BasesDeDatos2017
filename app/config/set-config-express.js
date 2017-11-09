

var path = require('path');
var express=require('express');
var bodyparser= require('body-parser');



var expressConfig = function(app){
    //Carga la configuración desde el archivo config.js
    app.set('config', require('./config'));
    
    //Exporto la configuración para poder usarla en otras partes
    app.locals.config = app.get('config');
 

    //View Engine
	app.set('view engine','ejs');
	//VIEJO->app.set('views', path.join(__dirname,'views'));
	app.set('views', path.join(process.cwd(), 'app', 'views'));

	//Body parser Middleware
	app.use(bodyparser.json());
	app.use(bodyparser.urlencoded({extended : true}));

	//Indico donde estarán los archivos estáticos, en este caso public, para que express puede acceder
	app.use('/public', express.static(process.cwd() + '/public'));
	//Indico donde están los paquetes de node_modules para que express puede acceder
	app.use('/node_modules', express.static(path.join(process.cwd() + '/node_modules')));


	//Me conecto a la base de datos



}

module.exports = expressConfig;
