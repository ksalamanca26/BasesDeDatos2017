
module.exports= function(sequelize, DataTypes){

return sequelize.define('tiposangre',{

	idTipoSangre : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		allowNull : false
	},

	Descripcion : {

		type : DataTypes.STRING,
		allowNull : false
	}

})


}