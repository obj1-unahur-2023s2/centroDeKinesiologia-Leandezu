import centro.*

class Paciente{
	var edad
	var fortalezaMuscular
	var nivelDeDolor
	var rutina = []
	
	method edad() = edad
	method fortalezaMuscular() = fortalezaMuscular
	method nivelDeDolor() = nivelDeDolor
	method aumentarFortaleza(cuanto){
		fortalezaMuscular += cuanto
	}
	method disminuirDolor(cuanto){
		nivelDeDolor -= cuanto
	}
	method usarAparato(unAparato){
		unAparato.aplicarEfectos(self)
	}
	method puedeUsarElAparato(aparato){
		return aparato.puedeSerUsado(self)
	}
	method puedeHacerLaRutina(unaRutina){
		return rutina.all({r => self.puedeUsarElAparato(r)})
	}
	method hacerLaRutina(){
		rutina.forEach({r => self.usarAparato(r)})
	}
	method tomarRutina(unaRutina){
		rutina = unaRutina
		if(not self.puedeHacerLaRutina(unaRutina)){
		self.error("No puede hacer la rutina")
		}
		self.hacerLaRutina()
	}
	method irAlCentro(){
		centro.asignarRutina(self)
	}
	method cantidadDeAparatos(){
		return rutina.size()
	}
}

class PacienteResistente inherits Paciente{
	override method tomarRutina(unaRutina){
		super(unaRutina)
		self.aumentarFortaleza(self.cantidadDeAparatos())
	}
}

class PacienteCaprichoso inherits Paciente{
	method algunAparatoEsRojo(unaRutina){
		return unaRutina.any({a => a.color() == "rojo"})
	}
	override method puedeHacerLaRutina(unaRutina){
		return super(unaRutina) and self.algunAparatoEsRojo(unaRutina)
	}
	override method tomarRutina(unaRutina){
		super(unaRutina)
		super(unaRutina)
	}
}

class PacienteRecuperado inherits Paciente{
	var property recuperacion = 3
	
	override method tomarRutina(unaRutina){
		super(unaRutina)
		self.disminuirDolor(recuperacion)
	}
}

class Magneto{
	const color
	
	method color() = color
	method aplicarEfectos(paciente){
		paciente.disminuirDolor(paciente.nivelDeDolor() * 0.1)
	}
	method puedeSerUsado(paciente){
		return true
	}
}

class Bicicleta{
	const color
	
	method color() = color
	method aplicarEfectos(paciente){
		if(not self.puedeSerUsado(paciente)){
			self.error("El paciente no puede usar el aparato")
		}
		paciente.disminuirDolor(4)
		paciente.aumentarFortaleza(3)
	}
	method puedeSerUsado(paciente){
		return paciente.edad() > 8
	}
}

class Minitramp{
	const color
	
	method color() = color
	method aplicarEfectos(paciente){
		if(not self.puedeSerUsado(paciente)){
			self.error("El paciente no puede usar el aparato")
		}
		paciente.aumentarFortaleza(paciente.edad() * 0.1)
	}
	method puedeSerUsado(paciente){
		return paciente.nivelDeDolor() < 20
	}
}

