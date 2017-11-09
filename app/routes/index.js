'use strict';
 
var routesIndex = function(app, controllers){
 
  //Index
  app.get("/", controllers.index.main);
  //app.route('/').get(controllers.index.main);

app.get("/buscarDatos", controllers.index.buscarDatos);

app.post("/buscarDatos", controllers.index.buscarDatosP);

app.get("/insertaPaciente", controllers.index.insertaPaciente);

app.post("/insertaPaciente", controllers.index.insertaPacienteP);

app.get('/buscarHistoria', controllers.index.buscarHistoria);

app.get('/buscarFactura', controllers.index.buscarFactura);

}

module.exports = routesIndex;