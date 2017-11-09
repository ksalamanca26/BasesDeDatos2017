
var resultado= new Array();

/*app.post('/buscarDatos',function(req,resp){
	console.log(req.body);
	var cedula=req.body.cedula;
	connection.query("SELECT * FROM paciente WHERE paciente.CedulaP = '"+cedula+"'", function(error, rows){
	
	if (!!error){
		console.log(error);
	}
	else{
		console.log('Se completo el query \n');
		var resultado=rows;
		console.log(resultado[0].PNombre);
		
	    resp.render('resultadoBuscarDatos',
	    	{resultado:resultado
	    });
	}

	 })

})
/*app.post('/buscarDatos',function(req,resp){
	console.log(req.body);

	var cedula=req.body.cedula;

	//connection.query("SELECT idPaciente FROM paciente WHERE paciente.PNombre = '"+nombre+"'", function(error, rows){
	connection.query("SELECT * FROM paciente WHERE ", function(error, rows){
	if (!!error){
		console.log(error);
	}
	else{
		console.log('Se completo el query \n');
		var resultado=rows;
		console.log(resultado);
		
	    resp.json(resultado)
	    };
	})

})*/

app.get('/',function(req,resp){

	resp.render('index');
})

app.get('/buscarDatos',function(req,resp){

	resp.render('buscarDatos');
})

app.get('/buscarAntecedentes',function(req,resp){

	resp.render('buscarAntecedentes');
})

app.post('/buscarAntecedentes',function(req,resp){
	console.log(req.body);
	var cedula=req.body.cedula;
	connection.query("SELECT * FROM antecedente WHERE antecedente.idPaciente = (SELECT paciente.idPaciente FROM paciente WHERE paciente.CedulaP='"+cedula+"')", function(error, rows){
	
	if (!!error){
		console.log(error);
	}
	else{
		console.log('Se completo el query \n');
		var resultado=rows;
	
		
	    resp.render('resultadoBuscarAntecedentes',
	    	{resultado:resultado
	    });
	}

	 })
})

app.get('/insertaPaciente',function(req,resp){

	resp.render('insertaPaciente');
})

app.post('/insertaPaciente',function(req,resp){

var cedula=req.body.cedula;
var Seguro= req.body.Seguro;
var PNombre=req.body.PNombre;
var SNombre= req.body.SNombre;
var Sexo= req.body.Sexo;
var TipoSangre= req.body.TipoSangre;
var PApellido= req.body.PApellido;
var SApellido= req.body.SApellido;
var edoCivil= req.body.edoCivil;
var tlfn = req.body.tlfn;
var fechaNac= req.body.fechaNac;



connection.query("INSERT INTO paciente (CedulaP, SeguroSocial, PNombre, SNombre, PApellido, SApellido, Sexo, TipoSangre, FechaNacimiento, EdoCivil, Telefono) VALUES ("+cedula+", '"+Seguro+"', '"+PNombre+"', '"+SNombre+"', '"+PApellido+"', '"+SApellido+"', '"+Sexo+"', '"+TipoSangre+"', '"+fechaNac+"', '"+edoCivil+"', "+tlfn+")",function(error, rows){
if (!!error){
		console.log(error);
	}

	else{
console.log('Se completo el query \n');
resp.send('Se completo la insercion');

	}

})


})

app.get('/insertaAntecedente',function(req,resp){

	resp.render('insertaAntecedente');
})

app.post('/insertaAntecedente',function(req,resp){

var cedula=req.body.cedula;
var tipo=req.body.Tipo;
var descripcion=req.body.Descripción;

		connection.query("INSERT INTO antecedente (idPaciente) SELECT idPaciente FROM paciente WHERE CedulaP="+cedula, function(error, rows){

			if(!!error){

				console.log(error);
			}

			else{

			console.log('Se completo el query \n');
			

			}

		})

		connection.query("UPDATE antecedente SET Descripcion='"+descripcion+"', Tipo='"+tipo+"' WHERE idPaciente=(SELECT idPaciente FROM paciente WHERE CedulaP="+cedula+")",function(error, rows){
			if (!!error){
				console.log(error);
			}

			else{
				console.log('Se completo el query \n');
				resp.send('Se completo la insercion');

			}

		})


})

app.get('/buscarHistoria',function(req,resp){

	resp.render('buscarHistoria');
})

app.post('/buscarHistoria',function(req, resp){


var cedula=req.body.cedula;

connection.query("Select PNombre, Fecha, Diagnostico, Instrucciones  from rel_informe a inner join paciente b on a.idpaciente=b.idpaciente Where CedulaP="+cedula, function(error, rows){
	
	if (!!error){
		console.log(error);
	}
	else{
		console.log('Se completo el query \n');
		var resultado=rows;
	    resp.render('resultadoBuscarHistoria',
	    	{resultado:resultado
	    });
	}

	 })



})

app.get('/crearInforme',function(req,resp){

	resp.render('crearInforme');
})


/*app.post('/crearInforme',function(req,resp){

var cedulaMedico=req.body.cedMedico;
var cedulaPaciente=req.body.cedPaciente;
var diagnostico=req.body.diagnostico;
var medicamento=req.body.medicamento;
var alter=req.body.alternativa;
var instrucc=req.body.instrucciones;
var fecha=req.body.fecha;
var sintoma1=req.body.sintoma1;
var sintoma2=req.body.sintoma2;

		connection.query("INSERT INTO rel_informe (idPaciente) SELECT idPaciente FROM paciente WHERE CedulaP="+cedulaPaciente, function(error, rows){

			if(!!error){

				console.log(error);
			}

			else{

			console.log('Se completo el query \n');
			

			}

		})

		connection.query("INSERT INTO medicamento(Nombre) VALUES ('"+medicamento+"')",function(error, rows){
			if (!!error){
				console.log(error);
			}

			else{
				console.log('Se completo el query \n');

			}

		})

		connection.query("UPDATE rel_informe SET idMedico=(SELECT idMedico FROM medico WHERE CedulaM="+cedulaMedico+"), idMedicamento=(SELECT idMedicamento FROM medicamento WHERE Nombre='"+medicamento+"') , Diagnostico='"+diagnostico+"', Instrucciones='"+instrucc+"', Fecha='"+fecha"' WHERE idPaciente=(SELECT idPaciente FROM paciente WHERE CedulaP="+cedulaPaciente+")",function(error, rows){
			if (!!error){
				console.log(error);
			}

			else{
				console.log('Se completo el query \n');
				

			}

		})

		connection.query("UPDATE medicamento SET Equivalente='"+alter+"' WHERE Nombre='"+medicamento+"'",function(error, rows){
			if (!!error){
				console.log(error);
			}

			else{
				console.log('Se completo el query \n');
				

			}

		})

		connection.query("INSERT INTO sintoma(idInforme,Nombre) VALUES ((SELECT idInforme FROM rel_informe WHERE Fecha='"+fecha+"'),'"+sintoma1+"')",function(error, rows){
			if (!!error){
				console.log(error);
			}

			else{
				console.log('Se completo el query \n');

			}

		})

		connection.query("INSERT INTO sintoma(idInforme,Nombre) VALUES ((SELECT idInforme FROM rel_informe WHERE Fecha='"+fecha+"'),'"+sintoma2+"')",function(error, rows){
			if (!!error){
				console.log(error);
			}

			else{
				console.log('Se completo el query \n');
				resp.send('Se completo la insercion');

			}

		})



})*/


app.get('/citasporMedico',function(req,resp){

	resp.render('citasporMedico');
})

app.post('/citasporMedico',function(req,resp){

	var cedula=req.body.cedula;

	connection.query("SELECT consultorio.Fecha, consultorio.Hora, medico.PNombre, medico.PApellido, consultorio.Disponibilidad FROM consultorio INNER JOIN medico ON consultorio.idMedico=medico.idMedico WHERE medico.idMedico=(SELECT idMedico FROM medico WHERE CedulaM="+cedula+")",function(error,rows){


	if(!!error){
		console.log(error);
	}

	else{
	console.log('Se completo el query \n');
			var resultado=rows;
		    resp.render('resultadoCitasPorMedico',
		    	{resultado:resultado
		    });

	}


	})
})

app.get('/citasportodoslosMedicos',function(req,resp){

	resp.render('citasportodoslosMedicos');
})

app.post('/citasportodoslosMedicos',function(req,resp){

	//var cedula=req.body.cedula;

	connection.query("SELECT consultorio.Fecha, consultorio.Hora, medico.PNombre, medico.PApellido, consultorio.Disponibilidad FROM consultorio INNER JOIN medico ON consultorio.idMedico=medico.idMedico",function(error,rows){


	if(!!error){
		console.log(error);
	}

	else{
	console.log('Se completo el query \n');
			var resultado=rows;
		    resp.render('resultadoCitasportodoslosMedicos',
		    	{resultado:resultado
		    });

	}


	})
})

app.get('/citasdePacientes',function(req,resp){

	resp.render('citasdePacientes');
})

app.post('/citasdePacientes',function(req, resp){

var cedula=req.body.cedula;

connection.query("Select paciente.PNombre, cita.Tipocita, cita.Fecha , cita.Hora , cita.Estadocita from cita inner join paciente on cita.idPaciente=paciente.idPaciente where paciente.idpaciente=(select idPaciente from paciente where CedulaP="+cedula+")",function(error,rows){


if(!!error){
	console.log(error);
}

else{

console.log('Se completo el query \n');
		var resultado=rows;
		
	    resp.render('resultadoCitasDePacientes',
	    	{resultado:resultado
	    });


}

})


})

app.get('/crearCitas',function(req,resp){

	resp.render('crearCitas');
})

app.get('/buscarFactura',function(req,resp){

	resp.render('buscarFactura');
})

app.post('/buscarFactura',function(req,resp){

var cedula=req.body.cedula;
connection.query("SELECT * FROM factura WHERE factura.idCita = (SELECT cita.idCita FROM cita WHERE cita.idPaciente = (SELECT paciente.idPaciente FROM paciente WHERE paciente.CedulaP ="+cedula+"))", function(error, rows){
	
	if (!!error){
		console.log(error);
	}
	else{
		console.log('Se completo el query \n');
		var resultado=rows;
		
	    resp.render('resultadoBuscarFactura',
	    	{resultado:resultado
	    });
	}

	 })



})

app.get('/buscarCitaporFecha',function(req,resp){

	resp.render('buscarCitaporFecha');
})


