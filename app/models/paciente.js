

module.exports = function(sequelize, DataTypes)
{

return sequelize.define('paciente',{

     
     idPaciente : {

          type: DataTypes.INTEGER,
          primaryKey : true,
          autoIncrement : true,
          allowNull : false
     },

     SeguroSocial : {

          type : DataTypes.INTEGER,
          allowNull : false
     },

     FechaNacimiento : {

          type : DataTypes.DATE,
          allowNull : false
     },

     LugarNacimiento : {

          type : DataTypes.STRING,
          allowNull : false
     },

     Direccion : {

          type : DataTypes.STRING,
          allowNull : false
     },

     EdoCivil : {

          type : DataTypes.STRING,
          allowNull : false
     }

     
})

}


