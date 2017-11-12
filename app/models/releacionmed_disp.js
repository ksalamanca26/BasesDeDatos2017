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

	var medico = connection.import(path.join(process.cwd(), 'app', 'models', 'medico'));
	var disponibilidad = connection.import(path.join(process.cwd(), 'app', 'models', 'disponibilidad'));

return sequelize.define('relacionmed_disp',{

	idMedico : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : medico,
			key : 'idMedico'
		}
	},

	idDisponibilidad : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : disponibilidad,
			key : 'idDisponibilidad'
		}
	}

})


}