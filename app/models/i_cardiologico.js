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

	var cardiologo = connection.import(path.join(process.cwd(), 'app', 'models', 'cardiologo'));
	var informe = connection.import(path.join(process.cwd(), 'app', 'models', 'informe'));	

return sequelize.define('i_cardiologico',{

	idInforme : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : informe,
			key : 'idInforme'
		}
	},

	idCardiologo : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : cardiologo,
			key : 'idCardiologo'
		}
	},

	PresionArterial : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Pulso : {

		type: DataTypes.STRING,
		allowNull : false
	}
})


}