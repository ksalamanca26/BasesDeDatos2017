module.exports = function(db, cb)
{

var Consultorio=db.define("consultorio", {

     NroConsultorio : {   	type: "serial", key : true},
     IdMedico : { type : "integer", size : 11}, 
     Fecha: {type : "text"}, 
     Hora : {type : "text"},
     Disponibilidad : {type: "text", size : 1}
});

}