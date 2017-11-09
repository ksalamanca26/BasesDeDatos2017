module.exports = function(db, cb)
{

var Informe=db.define("rel_informe", {

     idInforme : {  type: "serial", key : true},
     IdMedico : { type : "integer", size : 11}, 
     idPaciente : {type : "integer", size : 11},
     idMedicamento : {type : "integer", size : 11},
     Diagnostico : {type : "text"},
     Instrucciones : {type : "text"},
     Fecha: {type : "text"}
});

}