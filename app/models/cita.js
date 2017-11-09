module.exports = function(sequelize, DataTypes)
{
	  var path = require('path');

 var Sequelize = require('sequelize');
var connection = new Sequelize('medictype', 'root', 'password', {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }
});

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

	type : DataTypes.STRING(1)


},

Fecha : {

	type : DataTypes.STRING
},

Hora : {

	type : DataTypes.STRING
},

Estadocita : {

	type :DataTypes.STRING(1)
}



})

}