module.exports= function(sequelize, DataTypes){

return sequelize.define('enfermedad',{

	idEnfermedad : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false
	},

	NombreE : {

		type : DataTypes.STRING,
		allowNull : false
	}
})


}