 var path = require('path');

 var Sequelize = require('sequelize');
var connection = new Sequelize('easymedic', 'root', 'password', {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }
});

module.exports = function(sequelize, DataTypes)
{

	var paciente = connection.import(path.join(process.cwd(), 'app', 'models', 'paciente'));
	var antecedente = connection.import(path.join(process.cwd(), 'app', 'models', 'antecedente_inf'));

return sequelize.define('informe',{

	idInforme : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false
	},

	idPaciente : {

		type : DataTypes.INTEGER,
		allowNull : false,
		references : {

			model : paciente,
			key : 'idPaciente'
		}
	},

	idAntecedente : {

		type : DataTypes.INTEGER,
		allowNull : false,
		references :{

			model : antecedente,
			key : 'idAntecedente'
		}
	},


	Sintoma : {

		type : DataTypes.STRING
	},

	Diagnostico : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Instruccion : {

		type : DataTypes.STRING
	},

	Fecha : {

		type : DataTypes.DATE,
		allowNull : false
	}
})

}