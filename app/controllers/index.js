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

  resultadoBuscarHistoriaCardio : function(req,res){



    connection.query("SELECT antecedente_inf.*, antecedente_cardiologo.*, alergeno.* FROM persona INNER JOIN paciente ON persona.idPersona = paciente.idPersona INNER JOIN informe ON paciente.idPaciente=informe.idPaciente INNER JOIN antecedente_cardiologo ON informe.idInforme=antecedente_cardiologo.idInforme INNER JOIN antecedente_inf ON antecedente_cardiologo.idAntecedente = antecedente_inf.idAntecedente_Inf INNER JOIN rel_antecedente_alergeno ON antecedente_inf.idAntecedente_Inf = rel_antecedente_alergeno.idAntecedente INNER JOIN alergeno ON rel_antecedente_alergeno.idAlergeno = alergeno.idAlergeno WHERE persona.Cedula ="+req.body.cedula)
    .then(json1=>{
      var prueba=json1[0];
      console.log(prueba[0]);
    
      connection.query("SELECT informe.*, i_cardiologico.*, enfermedad.*, medicamento.* from persona inner join paciente on persona.idPersona = paciente.idPersona inner join informe on paciente.idPaciente = informe.idPaciente inner join i_cardiologico on informe.idInforme = i_cardiologico.idInforme  inner join rel_inf_enfermedad on i_cardiologico.idInforme = rel_inf_enfermedad.idInforme inner join enfermedad on rel_inf_enfermedad.idEnfermedad = enfermedad.idEnfermedad inner join rel_inf_medicamento on rel_inf_enfermedad.idInforme = rel_inf_medicamento.idInforme inner join medicamento on rel_inf_medicamento.idMedicamento = medicamento.idMedicamento where persona.Cedula = "+req.body.cedula)
      .then(json2=>{
        console.log(json2);

        res.render('resultadoBuscarHistoriaCardio',{

          resultado1 : prueba,
          resultado2 : json2[0]

        });


      })

    });


  },

  buscarHistoriaO : function(req,res){

    return res.render('buscarHistoriaO');
  },

  resultadoBuscarHistoriaOftalm : function(req,res){

    connection.query("SELECT antecedente_inf.*, antecedente_oftalmologo.*, alergeno.* FROM persona INNER JOIN paciente ON persona.idPersona = paciente.idPersona INNER JOIN informe ON paciente.idPaciente=informe.idPaciente INNER JOIN antecedente_oftalmologo ON informe.idInforme=antecedente_oftalmologo.idInforme INNER JOIN antecedente_inf ON antecedente_oftalmologo.idAntecedente = antecedente_inf.idAntecedente_Inf INNER JOIN rel_antecedente_alergeno ON antecedente_inf.idAntecedente_Inf = rel_antecedente_alergeno.idAntecedente INNER JOIN alergeno ON rel_antecedente_alergeno.idAlergeno = alergeno.idAlergeno WHERE persona.Cedula ="+req.body.cedula)
    .then(json1=>{
      var prueba=json1[0];
      console.log(prueba[0]);
    
      connection.query("SELECT informe.*, i_oftalmologo.*, enfermedad.*, medicamento.* from persona inner join paciente on persona.idPersona = paciente.idPersona inner join informe on paciente.idPaciente = informe.idPaciente inner join i_oftalmologo on informe.idInforme = i_oftalmologo.idInforme  inner join rel_inf_enfermedad on i_oftalmologo.idInforme = rel_inf_enfermedad.idInforme inner join enfermedad on rel_inf_enfermedad.idEnfermedad = enfermedad.idEnfermedad inner join rel_inf_medicamento on rel_inf_enfermedad.idInforme = rel_inf_medicamento.idInforme inner join medicamento on rel_inf_medicamento.idMedicamento = medicamento.idMedicamento where persona.Cedula = "+req.body.cedula)
      .then(json2=>{
        console.log(json2);

        res.render('resultadoBuscarHistoriaOftalm',{

          resultado1 : prueba,
          resultado2 : json2[0]

        });


      })

    });
  },

  buscarHistoriaP : function(req,res){

    return res.render('buscarHistoriaP');

  },

  resultadoBuscarHistoriaPed : function(req,res){

    connection.query("SELECT antecedente_inf.*, antecedente_pediatrico.*, alergeno.* FROM persona INNER JOIN paciente ON persona.idPersona = paciente.idPersona INNER JOIN informe ON paciente.idPaciente=informe.idPaciente INNER JOIN antecedente_pediatrico ON informe.idInforme=antecedente_pediatrico.idInforme INNER JOIN antecedente_inf ON antecedente_pediatrico.idAntecedente = antecedente_inf.idAntecedente_Inf INNER JOIN rel_antecedente_alergeno ON antecedente_inf.idAntecedente_Inf = rel_antecedente_alergeno.idAntecedente INNER JOIN alergeno ON rel_antecedente_alergeno.idAlergeno = alergeno.idAlergeno WHERE persona.Cedula ="+req.body.cedula)
    .then(json1=>{
      var prueba=json1[0];
      console.log(prueba[0]);
    
      connection.query("SELECT informe.*, i_pediatra.*, enfermedad.*, medicamento.* from persona inner join paciente on persona.idPersona = paciente.idPersona inner join informe on paciente.idPaciente = informe.idPaciente inner join i_pediatra on informe.idInforme = i_pediatra.idInforme  inner join rel_inf_enfermedad on i_pediatra.idInforme = rel_inf_enfermedad.idInforme inner join enfermedad on rel_inf_enfermedad.idEnfermedad = enfermedad.idEnfermedad inner join rel_inf_medicamento on rel_inf_enfermedad.idInforme = rel_inf_medicamento.idInforme inner join medicamento on rel_inf_medicamento.idMedicamento = medicamento.idMedicamento where persona.Cedula = "+req.body.cedula)
      .then(json2=>{
        console.log(json2);

        res.render('resultadoBuscarHistoriaPed',{

          resultado1 : prueba,
          resultado2 : json2[0]

        });


      })

    });
  },

  crearHistoriaPediatrica : function(req,res){

    return res.render('crearHistoriaPediatrica');
  },

  crearHistoriaPediatricaP : function(req,res){

  Persona.findOne({

    where : {

      Cedula : req.body.cedulaPac
    }

  }).then(persona1=>{

    Paciente.findOne({

      where : {

        idPersona : persona1.dataValues.idPersona
      }
    }).then(paciente =>{


      Persona.findOne({

        where : {

          Cedula : req.body.cedulaMed

        }

      }).then(persona2 =>{

        Medico.findOne({

          where : {

            idPersona : persona2.dataValues.idPersona

          }

        }).then(medico =>{

          connection.query("INSERT INTO informe (idPaciente, Sintoma, Diagnostico, Instruccion, Fecha) values ("+paciente.dataValues.idPaciente+", '"+req.body.sintoma+"', '"+req.body.diagnostico+"', '"+req.body.instrucc+"', '"+req.body.fecha+"')")
          .then(json1=>{

            var idInforme=json1[0];

            connection.query("INSERT INTO i_pediatra (idInforme, idMedico, Peso, Altura) VALUES ("+idInforme+", "+medico.dataValues.idMedico+", "+req.body.peso+", "+req.body.estatura+")")
            .then(json2=>{

              connection.query("INSERT INTO antecedente_inf (TipoAntecedente, NroIntervenciones) VALUES ('"+req.body.tipoAntec+"', "+req.body.intervenc+")")
              .then(json3=>{

                var idAntecedente= json3[0];

                connection.query("INSERT INTO antecedente_pediatrico (idAntecedente, idInforme, Vacuna, Asmatico) VALUES ("+idAntecedente+", "+idInforme+", '"+req.body.vacuna+"', '"+req.body.asmatico+"')")
                .then(fin=>{

                  res.send("Se ha creado una nueva historia médica exitosamente");
                })
                
              })
            })

          })
        })

      })

    })

  });

  },

   crearHistoriaCardio : function(req,res){

    return res.render('crearHistoriaCardio');
  },

  crearHistoriaCardioP : function(req,res){


Persona.findOne({

    where : {

      Cedula : req.body.cedulaPac
    }

  }).then(persona1=>{

    Paciente.findOne({

      where : {

        idPersona : persona1.dataValues.idPersona
      }
    }).then(paciente =>{


      Persona.findOne({

        where : {

          Cedula : req.body.cedulaMed

        }

      }).then(persona2 =>{

        Medico.findOne({

          where : {

            idPersona : persona2.dataValues.idPersona

          }

        }).then(medico =>{

          connection.query("INSERT INTO informe (idPaciente, Sintoma, Diagnostico, Instruccion, Fecha) values ("+paciente.dataValues.idPaciente+", '"+req.body.sintoma+"', '"+req.body.diagnostico+"', '"+req.body.instrucc+"', '"+req.body.fecha+"')")
          .then(json1=>{

            var idInforme=json1[0];

            connection.query("INSERT INTO i_cardiologico (idInforme, idMedico, PresionArterial, Pulso) VALUES ("+idInforme+", "+medico.dataValues.idMedico+", '"+req.body.presion+"', '"+req.body.pulso+"')")
            .then(json2=>{

              connection.query("INSERT INTO antecedente_inf (TipoAntecedente, NroIntervenciones) VALUES ('"+req.body.tipoAntec+"', "+req.body.intervenc+")")
              .then(json3=>{

                var idAntecedente= json3[0];

                connection.query("INSERT INTO antecedente_cardiologo (idAntecedente, idInforme, Cigarrillos, Hipertenso, Diabetico) VALUES ("+idAntecedente+", "+idInforme+", '"+req.body.cigarrillo+"', '"+req.body.Hipertenso+"', '"+req.body.diabetico+"')")
                .then(fin=>{

                  res.send("Se ha creado una nueva historia médica exitosamente");
                })
                
              })
            })

          })
        })

      })

    })

  });

    },

   crearHistoriaOftalm : function(req,res){

    return res.render('crearHistoriaOftalm');
  },

  crearHistoriaOftalmP : function(req,res){


    Persona.findOne({

    where : {

      Cedula : req.body.cedulaPac
    }

  }).then(persona1=>{

    Paciente.findOne({

      where : {

        idPersona : persona1.dataValues.idPersona
      }
    }).then(paciente =>{


      Persona.findOne({

        where : {

          Cedula : req.body.cedulaMed

        }

      }).then(persona2 =>{

        Medico.findOne({

          where : {

            idPersona : persona2.dataValues.idPersona

          }

        }).then(medico =>{

          connection.query("INSERT INTO informe (idPaciente, Sintoma, Diagnostico, Instruccion, Fecha) values ("+paciente.dataValues.idPaciente+", '"+req.body.sintoma+"', '"+req.body.diagnostico+"', '"+req.body.instrucc+"', '"+req.body.fecha+"')")
          .then(json1=>{

            var idInforme=json1[0];

            connection.query("INSERT INTO i_oftalmologo (idInforme, idMedico, Grado_vision, Presion_intraocular) VALUES ("+idInforme+", "+medico.dataValues.idMedico+", '"+req.body.gradoVision+"', '"+req.body.presionIntra+"')")
            .then(json2=>{

              connection.query("INSERT INTO antecedente_inf (TipoAntecedente, NroIntervenciones) VALUES ('"+req.body.tipoAntec+"', "+req.body.intervenc+")")
              .then(json3=>{

                var idAntecedente= json3[0];

                connection.query("INSERT INTO antecedente_oftalmologo (idAntecedente, idInforme, Formula, TipoLentes) VALUES ("+idAntecedente+", "+idInforme+", '"+req.body.formula+"', '"+req.body.tipoLentes+"')")
                .then(fin=>{

                  res.send("Se ha creado una nueva historia médica exitosamente");
                })
                
              })
            })

          })
        })

      })

    })

  });


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

                res.send("Se ha insertado el paciente exitosamente");
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

  },

  crearInformePed : function(req, res){

    res.render('crearInformePed');

  },

  crearInformePedP : function(req,res){

    Persona.findOne({

    where : {

      Cedula : req.body.cedulaPac
    }

  }).then(persona1=>{

    Paciente.findOne({

      where : {

        idPersona : persona1.dataValues.idPersona
      }
    }).then(paciente =>{


      Persona.findOne({

        where : {

          Cedula : req.body.cedulaMed

        }

      }).then(persona2 =>{

        Medico.findOne({

          where : {

            idPersona : persona2.dataValues.idPersona

          }

        }).then(medico =>{

          connection.query("INSERT INTO informe (idPaciente, Sintoma, Diagnostico, Instruccion, Fecha) values ("+paciente.dataValues.idPaciente+", '"+req.body.sintoma+"', '"+req.body.diagnostico+"', '"+req.body.instrucc+"', '"+req.body.fecha+"')")
          .then(json1=>{

            var idInforme=json1[0];

            connection.query("INSERT INTO i_pediatra (idInforme, idMedico, Peso, Altura) VALUES ("+idInforme+", "+medico.dataValues.idMedico+", "+req.body.peso+", "+req.body.estatura+")")
            .then(json2=>{

              res.send("Se ha creado un nuevo informe exitosamente");
            })

          })
        })

      })

    })

  });

  },

  crearInformeCardio : function(req,res){

    res.render('crearInformeCardio');
  },

  crearInformeCardioP : function(req,res){

    Persona.findOne({

    where : {

      Cedula : req.body.cedulaPac
    }

  }).then(persona1=>{

    Paciente.findOne({

      where : {

        idPersona : persona1.dataValues.idPersona
      }
    }).then(paciente =>{


      Persona.findOne({

        where : {

          Cedula : req.body.cedulaMed

        }

      }).then(persona2 =>{

        Medico.findOne({

          where : {

            idPersona : persona2.dataValues.idPersona

          }

        }).then(medico =>{

          connection.query("INSERT INTO informe (idPaciente, Sintoma, Diagnostico, Instruccion, Fecha) values ("+paciente.dataValues.idPaciente+", '"+req.body.sintoma+"', '"+req.body.diagnostico+"', '"+req.body.instrucc+"', '"+req.body.fecha+"')")
          .then(json1=>{

            var idInforme=json1[0];

            connection.query("INSERT INTO i_cardiologico (idInforme, idMedico, PresionArterial, Pulso) VALUES ("+idInforme+", "+medico.dataValues.idMedico+", '"+req.body.presion+"', '"+req.body.pulso+"')")
            .then(json2=>{

                res.send("Se ha creado un nuevo informe exitosamente");
            })

          })
        })

      })

    })

  });

  },

  crearInformeOftalm : function(req,res){

    res.render('crearInformeOftalm');
  },

  crearInformeOftalmP : function(req, res){

      Persona.findOne({

    where : {

      Cedula : req.body.cedulaPac
    }

  }).then(persona1=>{

    Paciente.findOne({

      where : {

        idPersona : persona1.dataValues.idPersona
      }
    }).then(paciente =>{


      Persona.findOne({

        where : {

          Cedula : req.body.cedulaMed

        }

      }).then(persona2 =>{

        Medico.findOne({

          where : {

            idPersona : persona2.dataValues.idPersona

          }

        }).then(medico =>{

          connection.query("INSERT INTO informe (idPaciente, Sintoma, Diagnostico, Instruccion, Fecha) values ("+paciente.dataValues.idPaciente+", '"+req.body.sintoma+"', '"+req.body.diagnostico+"', '"+req.body.instrucc+"', '"+req.body.fecha+"')")
          .then(json1=>{

            var idInforme=json1[0];

            connection.query("INSERT INTO i_oftalmologo (idInforme, idMedico, Grado_vision, Presion_intraocular) VALUES ("+idInforme+", "+medico.dataValues.idMedico+", '"+req.body.gradoVision+"', '"+req.body.presionIntra+"')")
            .then(json2=>{

                res.send("Se ha creado un nuevo informe exitosamente");
            })

          })
        })

      })

    })

  });
  }


}


