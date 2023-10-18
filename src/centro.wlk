import pacientes.*

object centro{
	
	method asignarRutina(paciente){
		if(paciente.edad() >= 30){
			paciente.tomarRutina([new Bicicleta(color = "blanco"),
				new Minitramp(color = "blanco"),
				new Bicicleta(color = "blanco"),
				new Magneto(color = "blanco")
			])
		} else{
			paciente.tomarRutina([new Magneto(color = "blanco"),
				new Bicicleta(color = "blanco")
			])
		}
	}
}
