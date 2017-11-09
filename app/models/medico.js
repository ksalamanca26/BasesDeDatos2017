
module.exports = function(sequelize, DataTypes)
{

return sequelize.define('medico',{

	idMedico : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false
	},

	CedulaM : {

		type : DataTypes.INTEGER,
		unique : true
	},

	PNombre : {

		type : DataTypes.STRING

	},

	SNombre : {

		type : DataTypes.STRING
	},

	PApellido :{

		type : DataTypes.STRING
	},

	SApellido : {

		type : DataTypes.STRING
	},

	Especialidad :{

		type : DataTypes.STRING
	}

})

}

