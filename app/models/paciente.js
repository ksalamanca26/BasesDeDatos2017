module.exports = function(sequelize, DataTypes)
{

return sequelize.define('paciente',{
     
     idPaciente : {

          type: DataTypes.INTEGER,
          primaryKey : true,
          autoIncrement : true,
          allowNull : false
     },

     CedulaP : {

          type: DataTypes.INTEGER,
          unique : true
     },

     SeguroSocial : {

          type : DataTypes.INTEGER,
          unique : true
          

     },

     PNombre :{

          type : DataTypes.STRING
     },


     SNombre :{

          type : DataTypes.STRING
     },

     PApellido : {

          type : DataTypes.STRING
     },

     SApellido : {

          type : DataTypes.STRING
     },


     Sexo : {

          type : DataTypes.STRING(1)
     },

     TipoSangre : {

          type : DataTypes.STRING(4)
     },

     FechaNacimiento : {

          type : DataTypes.STRING
     },

     EdoCivil : {

          type : DataTypes.STRING(1)
     },

     Telefono : {

          type : DataTypes.INTEGER(14)
     },
})

}


