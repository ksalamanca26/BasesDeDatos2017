
 var path = require('path');

 var Sequelize = require('sequelize');
var connection = new Sequelize('easymedic', 'root', 'password', {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }
});

module.exports = function(sequelize, DataTypes)
{

     var persona = connection.import(path.join(process.cwd(), 'app', 'models', 'persona'));
     var tiposangre = connection.import(path.join(process.cwd(), 'app', 'models', 'tiposangre'));

return sequelize.define('paciente',{



     idPersona : {

          type : DataTypes.INTEGER,
          allowNull : false,
          references : {

               model : persona,
               key : 'idPersona'
          }
     },

     
     idPaciente : {

          type: DataTypes.INTEGER,
          primaryKey : true,
          autoIncrement : true,
          allowNull : false
     },


     idTipoSangre : {

          type : DataTypes.INTEGER,
          allowNull : false,
          references : {

               model : tiposangre,
               key : 'idTipoSangre'
          }
     },

     SeguroSocial : {

          type : DataTypes.INTEGER,
          allowNull : false
     },

     FechaNacimiento : {

          type : DataTypes.DATE,
          allowNull : false
     },

     LugarNacimiento : {

          type : DataTypes.STRING,
          allowNull : false
     },

     Direccion : {

          type : DataTypes.STRING,
          allowNull : false
     },

     EdoCivil : {

          type : DataTypes.STRING,
          allowNull : false
     }

     
})

}


