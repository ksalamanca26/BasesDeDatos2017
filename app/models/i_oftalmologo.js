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

	var oftalmologo = connection.import(path.join(process.cwd(), 'app', 'models', 'oftalmologo'));
	var informe = connection.import(path.join(process.cwd(), 'app', 'models', 'informe'));	

return sequelize.define('i_oftalmologo',{

	idInforme : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : informe,
			key : 'idInforme'
		}
	},

	idOftalmologo : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : oftalmologo,
			key : 'idOftalmologo'
		}
	},

	Grado_vision : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Presion_intraocular : {

		type: DataTypes.STRING,
		allowNull : false
	}
})


}