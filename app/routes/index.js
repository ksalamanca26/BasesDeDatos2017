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

app.get('/buscarHistoriaC', controllers.index.buscarHistoriaC);
app.post('/buscarHistoriaC',controllers.index.resultadoBuscarHistoriaCardio)

app.get('/buscarHistoriaO', controllers.index.buscarHistoriaO);
app.post('/buscarHistoriaO', controllers.index.resultadoBuscarHistoriaOftalm);

app.get('/buscarHistoriaP', controllers.index.buscarHistoriaP);
app.post('/buscarHistoriaP', controllers.index.resultadoBuscarHistoriaPed);

app.get('/crearHistoriaPediatrica',controllers.index.crearHistoriaPediatrica);
app.post('/crearHistoriaPediatrica',controllers.index.crearHistoriaPediatricaP);

app.get('/crearHistoriaCardio', controllers.index.crearHistoriaCardio);
app.post('/crearHistoriaCardio', controllers.index.crearHistoriaCardioP);

app.get('/crearHistoriaOftalm', controllers.index.crearHistoriaOftalm);
app.post('/crearHistoriaOftalm', controllers.index.crearHistoriaOftalmP);

app.get('/crearInformePed', controllers.index.crearInformePed);
app.post('/crearInformePed', controllers.index.crearInformePedP);

app.get('/crearInformeCardio', controllers.index.crearInformeCardio);
app.post('/crearInformeCardio',controllers.index.crearInformeCardioP);

app.get('/crearInformeOftalm', controllers.index.crearInformeOftalm);
app.post('crearInformeOftalm',controllers.index.crearHistoriaOftalmP);

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

app.get('/verEnfermedades',controllers.index.verEnfermedades);

app.get('/verMedicamentos',controllers.index.verMedicamentos);

app.get('/modificarMedicamentos',controllers.index.modificarMedicamentos);

app.post('/modificarMedicamentos',controllers.index.modificarMedicamentosP);



}



module.exports = routesIndex;