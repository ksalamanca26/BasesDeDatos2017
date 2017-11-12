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

	var antecedente = connection.import(path.join(process.cwd(), 'app', 'models', 'antecedente_inf'));
	var alergeno = connection.import(path.join(process.cwd(), 'app', 'models', 'alergeno'));

return sequelize.define('rel_antecedente_alergeno',{

	idAntecedente : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : antecedente,
			key : 'idAntecedente'
		}
	},

	idAlergeno : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false,
		references : {
			model : alergeno,
			key : 'idAlergeno'
		}
	}

})


}