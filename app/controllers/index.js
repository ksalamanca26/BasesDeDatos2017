  var path = require('path');
 var Sequelize = require('sequelize');
var connection = new Sequelize('medictype', 'root', 'password', {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }
});

var Medico=connection.import(path.join(process.cwd(), 'app', 'models', 'medico'));
var Paciente=connection.import(path.join(process.cwd(), 'app', 'models', 'paciente'));
var Cita = connection.import(path.join(process.cwd(), 'app', 'models', 'cita'));
var Medicamento = connection.import(path.join(process.cwd(), 'app', 'models', 'medicamento'));
var Factura = connection.import(path.join(process.cwd(), 'app', 'models', 'factura'));




module.exports = {
    main: function (req, res) {

    //try {
      return res.render('index');
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

},

  buscarDatosP : function(req,res){
    try{

      Paciente.findOne({

  where : {

    CedulaP : req.body.cedula
  }


}).then(paciente => {

res.render('resultadoBuscarDatos', {

  resultado : paciente.dataValues
})

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


        Paciente.create({

          CedulaP : req.body.cedula,
          SeguroSocial : req.body.Seguro,
          PNombre : req.body.PNombre,
          SNombre : req.body.SNombre,
          PApellido : req.body.PApellido,
          SApellido : req.body.SApellido,
          Sexo : req.body.Sexo,
          TipoSangre : req.body.TipoSangre,
          FechaNacimiento : req.body.fechaNac,
          EdoCivil : req.body.edoCivil,
          Telefono : req.body.tlfn
        }).then(function(){

          res.send("Se ha insertado un paciente");

        })
    }
    catch(e){
      console.log(e);
    }
  },

  buscarHistoria : function(req,res){

return res.render('buscarHistoria');

  },

  buscarFactura : function(req,res){

    return res.render('buscarFactura');
  },

  buscarFacturaP: function(req,res){



  }



}


