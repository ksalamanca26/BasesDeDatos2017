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

	var pediatra = connection.import(path.join(process.cwd(), 'app', 'models', 'pediatra'));
	var informe = connection.import(path.join(process.cwd(), 'app', 'models', 'informe'));	

return sequelize.define('i_pediatra',{

	idInforme : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : informe,
			key : 'idInforme'
		}
	},

	idPediatra : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : pediatra,
			key : 'idPediatra'
		}
	},

	Peso : {

		type : DataTypes.INTEGER,
		allowNull : false
	},

	Altura : {

		type: DataTypes.INTEGER,
		allowNull : false
	}
})


}