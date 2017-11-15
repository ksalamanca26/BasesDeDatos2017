'use strict';
 
var routesIndex = function(app, controllers){
 
  //Index
  app.get("/", controllers.index.main);
  //app.route('/').get(controllers.index.main);
  app.get("/VistaPacientes", controllers.index.VistaPacientes);
  app.get("/VistaMedicos", controllers.index.VistaMedicos);

app.get("/buscarDatos", controllers.index.buscarDatos);

app.post("/buscarDatos", controllers.index.buscarDatosP);

app.get("/buscarMedicos", controllers.index.buscarMedicos);

app.get("/insertaPaciente", controllers.index.insertaPaciente);

app.post("/insertaPaciente", controllers.index.insertaPacienteP);

app.get('/buscarHistoria', controllers.index.buscarHistoria);

app.get('/buscarFactura', controllers.index.buscarFactura);

app.post('/buscarFactura', controllers.index.buscarFacturaP);

app.get('/buscarAntecedentes', controllers.index.buscarAntecedentes);

app.post('/buscarAntecedentes', controllers.index.buscarAntecedentesP);

app.get('/citasporMedico', controllers.index.citasporMedico);

app.post('/citasporMedico',controllers.index.citasporMedicoP);

app.get('/citasdePacientes', controllers.index.citasdePacientes);

app.post('/citasdePacientes',controllers.index.citasdePacientesP);

app.get('/crearCitas', controllers.index.crearCitas);

app.post('/crearCitas',controllers.index.crearCitasP);

}



module.exports = routesIndex;