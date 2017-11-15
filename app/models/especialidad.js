module.exports= function(sequelize, DataTypes){

return sequelize.define('especialidad',{

	idEspecialidad : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false,
		references : {
			model : informe,
			key : 'idInforme'
		}
	},

	Especialidad : {

		type : DataTypes.STRING
	
	}

})


}