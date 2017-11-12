module.exports= function(sequelize, DataTypes){

return sequelize.define('disponibilidad',{

	idDisponibilidad : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false
	},

	Dia : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Hora : {

		type : DataTypes.STRING,
		allowNull : false
	}
})


}