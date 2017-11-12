
module.exports = function(sequelize, DataTypes)
{

return sequelize.define('persona',{

	idPersona : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false
	},

	Cedula : {
		type : DataTypes.INTEGER,
		unique : true,
		allowNull : false

	},

	PNombre : {

		type : DataTypes.STRING,
		allowNull : false

	},

	SNombre : {

		type : DataTypes.STRING,
		allowNull : false
	},

	PApellido :{

		type : DataTypes.STRING,
		allowNull : false
	},

	SApellido : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Sexo :{

		type : DataTypes.STRING,
		allowNull : false
	}

})

}