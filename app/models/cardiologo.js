
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

return sequelize.define('cardiologo',{

	idMedico : {

		type : DataTypes.INTEGER,
		allowNull : false,
		references : {

			model : medico,
			key : 'idMedico'
		}
	},

	idCardiologo : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false
	},

	Hemodinamista : {

		type : DataTypes.STRING
	}

})


}