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

	var informe = connection.import(path.join(process.cwd(), 'app', 'models', 'informe'));
	var enfermedad = connection.import(path.join(process.cwd(), 'app', 'models', 'enfermedad'));

return sequelize.define('rel_inf_enfermedad',{

	idInforme : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : informe,
			key : 'idInforme'
		}
	},

	idEnfermedad : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : enfermedad,
			key : 'idEnfermedad'
		}
	}

})


}