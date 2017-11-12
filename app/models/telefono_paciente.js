var path = require('path');

 var Sequelize = require('sequelize');
var connection = new Sequelize('easymedic', 'root', 'password', {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }
});

module.exports= function(sequelize, DataTypes){

	var paciente = connection.import(path.join(process.cwd(), 'app', 'models', 'paciente'));

return sequelize.define('telefono_paciente',{

	idPaciente : {

		type : DataTypes.INTEGER,
		allowNull : false,
		references : {
			model : paciente,
			key : 'idPaciente'
		}
	},

	Telefono_paciente : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false
	}

})


}