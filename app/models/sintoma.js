module.exports = function(sequelize, DataTypes)
{

return sequelize.define('sintoma',{


idInforme : {

	type : DataTypes.INTEGER,
	primaryKey : true,
	autoIncrement : true,
	allowNull : false
},

Nombre : {

	type : DataTypes.STRING,
	primaryKey : true,
	allowNull : false

}


})

}