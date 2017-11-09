module.exports = function(sequelize, DataTypes)
{

return sequelize.define('medicamento',{


idMedicamento : {

	type : DataTypes.INTEGER,
	primaryKey : true,
	autoIncrement : true,
	allowNull : false
},

Nombre : {

	type : DataTypes.STRING
},

Equivalente : {

	type : DataTypes.STRING
}

})

}