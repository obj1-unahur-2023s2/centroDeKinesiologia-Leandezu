import pacientes.*

object centro{
	var aparatos = []
	var pacientes = []
	
	method aparatos() = aparatos
	method pacientes() = pacientes
	
	method coloresDeAparatos(){
		return aparatos.map({a => a.color()}).asSet()
	}
	method pacientesMenores(){
		return pacientes.filter({p => p.edad() < 8})
	}
	method pacientesQueNoCumplenSesion(){
		return pacientes.count({p => not p.puedeHacerLaRutina()})
	}
	method estaEnOptimasCondiciones(){
		return not aparatos.any({a => a.necesitaMantenimiento()})
	}
	method cuantosNecesitanMantenimiento(){
		return aparatos.count({a => a.necesitaMantenimiento()})
	}
	method cuantosNoNecesitanMantenimiento(){
		return aparatos.count({a => not a.necesitaMantenimiento()})
	}
	method estaComplicado(){
		return self.cuantosNecesitanMantenimiento() > self.cuantosNoNecesitanMantenimiento()
	}
	method visitarTecnico(){
		aparatos.forEach({a => a.aplicarMantenimiento()})
	}
}
