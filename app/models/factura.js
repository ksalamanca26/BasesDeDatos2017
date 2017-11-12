module.exports = function(sequelize, DataTypes)
{
  var path = require('path');
var Sequelize = require('sequelize');
var connection = new Sequelize('easymedic', 'root', 'password', {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }
});

var cita=connection.import(path.join(process.cwd(), 'app', 'models', 'cita'));
return sequelize.define('factura',{

NroFactura : {

	type : DataTypes.INTEGER,
	primaryKey : true,
	autoIncrement : true,
	allowNull : false
},

idCita : {

	type : DataTypes.INTEGER,
    references : {

    	model : cita,
    	key : 'idCita'
    }
},

FechaF : {

  type : DataTypes.INTEGER
},

MontoF : {

	type : DataTypes.INTEGER
}

})

}