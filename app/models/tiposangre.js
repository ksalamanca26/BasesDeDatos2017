
module.exports= function(sequelize, DataTypes){

return sequelize.define('tiposangre',{

	idTipoSangre : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false
	},

	Descripcion : {

		type : DataTypes.STRING,
		allowNull : false
	}

})


}