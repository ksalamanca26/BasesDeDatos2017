
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
	 

var medico=connection.import(path.join(process.cwd(), 'app', 'models', 'medico'));
var paciente=connection.import(path.join(process.cwd(), 'app', 'models', 'paciente'));

return sequelize.define('cita',{

idCita : {

	type : DataTypes.INTEGER,
	primaryKey : true,
	autoIncrement : true,
	allowNull : false
},

idMedico :{

	type : DataTypes.INTEGER,

	references : {

	model : medico,
	key : 'idMedico'

	}
},

idPaciente : {

	type : DataTypes.INTEGER,

	references : {

	model : paciente,
	key : 'idPaciente'

	}

},

Tipocita : {

	type : DataTypes.STRING


},

Hora : {

	type : DataTypes.STRING
},


Fecha : {

	type : DataTypes.DATE
},

Estadocita : {

	type :DataTypes.STRING
}



})

}