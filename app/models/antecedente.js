module.exports = function(db, cb)
{

var Antecedente=db.define("antecedente", {

     idAntecedente : {   	type: "serial", key : true},
     idPaciente : { type : "integer", size : 11}, 
     Descripcion: {type : "text"}, 
     Tipo : {type : "text", size : 1}

});

}