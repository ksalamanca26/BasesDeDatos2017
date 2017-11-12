module.exports = function(sequelize, DataTypes)
{

return sequelize.define('antecedente_inf',{


	idAntecedente_Inf : {

		type: DataTypes.INTEGER,
		primaryKey : true,
		autoIncremente : true,
		allownull : false
	},

	TipoAntecedente : {

		type : DataTypes.STRING,
		allownull : false
	},

	NroIntervenciones : {

		type : DataTypes.INTEGER
	},

	Vacunado : {
		type : DataTypes.STRING
	},

	Asmatico : {
		type : DataTypes.STRING
	},

	Cigarrillos : {

		type : DataTypes.STRING
	},

	Hipertenso : {
		type : DataTypes.STRING
	},

	Diabetico : {

		type : DataTypes.STRING
	},

	Formula : {

		type : DataTypes.STRING
	},

	TipoLentes : {

		type : DataTypes.STRING
	}
})


}