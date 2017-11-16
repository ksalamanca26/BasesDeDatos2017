  var path = require('path');
 var Sequelize = require('sequelize');
var connection = new Sequelize('easymedic', 'root', 'password', {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }
});
var Persona = connection.import(path.join(process.cwd(), 'app', 'models', 'persona'));
var Medico=connection.import(path.join(process.cwd(), 'app', 'models', 'medico'));
var Paciente=connection.import(path.join(process.cwd(), 'app', 'models', 'paciente'));
var Cita = connection.import(path.join(process.cwd(), 'app', 'models', 'cita'));
var Medicamento = connection.import(path.join(process.cwd(), 'app', 'models', 'medicamento'));
var Factura = connection.import(path.join(process.cwd(), 'app', 'models', 'factura'));
var TipoSangre = connection.import(path.join(process.cwd(), 'app', 'models', 'tiposangre'));
var Telefono_paciente= connection.import(path.join(process.cwd(), 'app', 'models', 'telefono_paciente'));
var Enfermedad = connection.import(path.join(process.cwd(), 'app', 'models', 'enfermedad'));




module.exports = {
    main: function (req, res) {

    //try {
      return res.render('PRINCIPAL');
   // } catch (e) {
    //  console.log("Error");
    }
    ,
    VistaPacientes: function (req, res) {

    //try {
      res.render('VistaPacientes');
   // } catch (e) {
    //  console.log("Error");
    }
    ,
    VistaMedicos: function (req, res) {

    //try {
      res.render('VistaMedicos');
   // } catch (e) {
    //  console.log("Error");
    }
    ,
    buscarDatos: function (req, res) {
    try {
      return res.render('buscarDatos');
    } catch (e) {
      console.log("Error");
    }
    }
    ,

  buscarDatosP : function(req,res){
    try{

      Persona.findOne({

        where : {

          Cedula : req.body.cedula
        }

      }).then(persona => {

        connection.query("SELECT persona.*, paciente.*, tiposangre.*, telefono_paciente.* FROM persona INNER JOIN paciente ON persona.idPersona = paciente.idPersona INNER JOIN tiposangre ON paciente.idTipoSangre = tiposangre.idTipoSangre INNER JOIN telefono_paciente ON paciente.idPaciente = telefono_paciente.idPaciente WHERE persona.idPersona= "+persona.dataValues.idPersona)
        .then(json =>{

      var respuesta=json[0];
      console.log(json);

          res.render('resultadoBuscarDatos', {

            resultado : respuesta[0]

          });
        });

      });

          }catch(e){
            console.log(e);
          }
  },

  buscarMedicos : function(req,res){
    try{

      connection.query("SELECT persona.*, medico.*, especialidad.* FROM persona INNER JOIN medico ON persona.idPersona = medico.idPersona INNER JOIN especialidad ON medico.idEspecialidad = especialidad.idEspecialidad")
      .then(json=>{

        var respuesta=json[0];
        console.log(respuesta);

      res.render('resultadoBuscarMedicos', {


        resultado : respuesta

      });


      });

          }catch(e){
            console.log(e);
          }
  },

  insertaPaciente : function(req, res){

    return res.render('insertaPaciente');


  },

  insertaPacienteP : function(req,res){


    try{


        Persona.create({

          Cedula : req.body.cedula,
          PNombre : req.body.PNombre,
          SNombre : req.body.SNombre,
          PApellido : req.body.PApellido,
          SApellido : req.body.SApellido,
          Sexo : req.body.Sexo
        }).then(persona => {

          TipoSangre.findOne({
            where : {
              Descripcion : req.body.TipoSangre
            }
          }).then(sangre=>{

            connection.query("INSERT INTO paciente (idPersona, idTipoSangre, SeguroSocial, FechaNacimiento, LugarNacimiento, Direccion, EdoCivil) values ("
              +persona.dataValues.idPersona+", "+sangre.dataValues.idTipoSangre+ ", "+req.body.Seguro+", '"+req.body.fechaNac+ "', '"+req.body.lugarNac+"', '"
              +req.body.direccion+"', '"+req.body.edoCivil+"')").then(json=>{

              var respuesta=json[0];
              console.log(respuesta);

              connection.query("INSERT INTO telefono_paciente (idPaciente, Telefono_paciente) values ("+respuesta+", "+req.body.tlfn+")").then(final=>{

                res.send("Se ha insertado el paciente");
              })



            })

            })

          });

        }
    catch(e){
      console.log(e);
    }
  },

  buscarHistoriaC : function(req,res){

return res.render('buscarHistoriaC');

  },

  buscarHistoriaO : function(req,res){

    return res.render('buscarHistoriaO');
  },

  buscarHistoriaP : function(req,res){

    return res.render('buscarHistoriaP');

  },

  crearHistoriaPediatrica : function(req,res){

    return res.render('crearHistoriaPediatrica');
  },

   crearHistoriaCardio : function(req,res){

    return res.render('crearHistoriaCardio');
  },
   crearHistoriaOftalm : function(req,res){

    return res.render('crearHistoriaOftalm');
  },

  buscarFactura : function(req,res){

    return res.render('buscarFactura');
  },

  buscarFacturaP: function(req,res){

Factura.findOne({

where : {

  NroFactura : req.body.NroFactura
}

}).then(factura=>{

console.log(factura);

res.render('resultadoBuscarFactura',{

resultado : factura

})

});

  },

  buscarAntecedentes : function(req,res){

res.render('buscarAntecedentes')

  },

  buscarAntecedentesP : function(req,res){


try{

      Persona.findOne({

  where : {

    Cedula : req.body.cedula
  }

}).then(persona => {

  connection.query("SELECT antecedente_inf.* FROM persona INNER JOIN paciente ON persona.idPersona = paciente.idPersona INNER JOIN informe ON paciente.idPaciente = informe.idPaciente INNER JOIN antecedente_inf ON antecedente_inf.idAntecedente_inf = informe.idAntecedente WHERE persona.idPersona= "+persona.dataValues.idPersona+" LIMIT 1")
  .then(json =>{

var respuesta=json[0];

    res.render('resultadoBuscarAntecedentes', {

      resultado : respuesta[0]
    });
  });

});

    }catch(e){
      console.log(e);
    }


  },

  insertaAntecedente : function(req, res){

    return res.render('insertaAntecedente');


  },

  insertaAntecedenteP : function(req,res){

    try{

        Antecedente.create({

          Cedula : req.body.cedula,
          PNombre : req.body.PNombre,
          SNombre : req.body.SNombre,
          PApellido : req.body.PApellido,
          SApellido : req.body.SApellido,
          Sexo : req.body.Sexo
        }).then(persona => {

          TipoSangre.findOne({
            where : {
              Descripcion : req.body.TipoSangre
            }
          }).then(sangre=>{

            connection.query("INSERT INTO paciente (idPersona, idTipoSangre, SeguroSocial, FechaNacimiento, LugarNacimiento, Direccion, EdoCivil) values ("
              +persona.dataValues.idPersona+", "+sangre.dataValues.idTipoSangre+ ", "+req.body.Seguro+", '"+req.body.fechaNac+ "', '"+req.body.lugarNac+"', '"
              +req.body.direccion+"', '"+req.body.edoCivil+"')").then(json=>{

              var respuesta=json[0];
              console.log(respuesta);

              connection.query("INSERT INTO telefono_paciente (idPaciente, Telefono_paciente) values ("+respuesta+", "+req.body.tlfn+")").then(final=>{

                res.send("Se ha insertado el paciente");
              })



            })

            })

          });

        }
    catch(e){
      console.log(e);
    }
  },

  citasporMedico : function(req,res){

    res.render('citasporMedico');
  },

  citasporMedicoP : function(req,res){


    try{

      Persona.findOne({

  where : {

    Cedula : req.body.cedula
  }

}).then(persona => {

  connection.query("SELECT persona.*, disponibilidad.* FROM persona INNER JOIN medico ON persona.idPersona = medico.idPersona INNER JOIN relacionmed_disp ON medico.idMedico = relacionmed_disp.idMedico INNER JOIN disponibilidad ON relacionmed_disp.idDisponibilidad = disponibilidad.idDisponibilidad WHERE persona.idPersona="+persona.dataValues.idPersona)
  .then(json =>{

var respuesta=json[0];
console.log(respuesta[0]);

    res.render('resultadoCitasPorMedico', {

      resultado : respuesta
    });
  });

});

    }catch(e){
      console.log(e);
    }


  },

  citasdePacientes : function(req,res){

    res.render('citasdePacientes');
  },

  citasdePacientesP: function (req,res){

    try{

      Persona.findOne({

  where : {

    Cedula : req.body.cedula
  }

}).then(persona => {

 Paciente.findOne({

  where :{

    idPersona : persona.dataValues.idPersona
  }
 }).then(paciente =>{

connection.query("SELECT persona.*, medico.*, cita.* from cita inner join medico on cita.idMedico = medico.idMedico inner join persona on medico.idPersona = persona.idPersona where cita.idPaciente="+paciente.dataValues.idPaciente)
.then(json=>{

var respuesta=json[0];
console.log(respuesta);

res.render('resultadoCitasDePacientes',{


resultado : respuesta

});

})

 })

});

    }catch(e){
      console.log(e);
    }

  },

  crearCitas : function(req, res){

    return res.render('crearCitas');


  },

  crearCitasP : function(req,res){

    Persona.findOne({

      where : {

        Cedula : req.body.cedPaciente

      }

    }).then(persona1=>{

      Persona.findOne({

        where : {

          Cedula : req.body.cedMedico
        }
      }).then(persona2=>{


        Paciente.findOne({

          where : {

            idPersona : persona1.dataValues.idPersona
          }

        }).then(paciente=>{

          Medico.findOne({

            where :{

              idPersona : persona2.dataValues.idPersona
            }
          }).then(medico=>{

            connection.query("INSERT INTO cita(idMedico, idPaciente, TipoCita, Hora, Fecha, EstadoCita) VALUES ("+medico.dataValues.idMedico+", "+paciente.dataValues.idPaciente+", '"+req.body.tipocita+"', '"+req.body.hora+"', '"+req.body.fecha+"', '"+req.body.edoCita+"')")
            .then(json=>{

              var respuesta=json[0];
            

              res.send("Cita creada exitosamente");

            })
          })
        })

      })


    });


  },

  verEnfermedades : function(req,res){


    Enfermedad.findAll().then(enfermedades=>{

      console.log(enfermedades);

      res.render('verEnfermedades', {

        resultado : enfermedades

      });

    })

  }, 

  verMedicamentos : function(req, res){

  Medicamento.findAll().then(medicamento=>{

      console.log(medicamento);

      res.render('verMedicamentos', {

        resultado : medicamento

      });

    })



  },

  modificarMedicamentos : function(req,res){


    res.render('resultadoModificarMedicamentos');
  },



  modificarMedicamentosP : function(req, res){


    Medicamento.findOne({

      where : {

      NombreM : req.body.medicamento
      }
    }).then(medicamento=>{
      console.log(medicamento);

      medicamento.updateAttributes({

        Equivalente: req.body.equivalente

      }).then(resultado=>{

        res.send("Se ha modificado el medicamento exitosamente");

      })

    });

  }


}


