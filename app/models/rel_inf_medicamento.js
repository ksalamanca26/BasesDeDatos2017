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
	var medicamento = connection.import(path.join(process.cwd(), 'app', 'models', 'medicamento'));

return sequelize.define('rel_inf_medicamento',{

	idInforme : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : informe,
			key : 'idInforme'
		}
	},

	idMedicamento : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : medicamento,
			key : 'idMedicamento'
		}
	}

})


}