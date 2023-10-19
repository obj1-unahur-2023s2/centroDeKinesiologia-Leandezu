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
	method puedeHacerLaRutina(){
		return rutina.all({r => self.puedeUsarElAparato(r)})
	}
	method hacerLaRutina(){
		rutina.forEach({r => self.usarAparato(r)})
	}
	method asignarRutina(unaRutina){
		rutina = unaRutina
	}
	method tomarRutina(){
		if(not self.puedeHacerLaRutina()){
		self.error("No puede hacer la rutina")
		}
		self.hacerLaRutina()
	}
	method cantidadDeAparatos(){
		return rutina.size()
	}
}

class PacienteResistente inherits Paciente{
	override method tomarRutina(){
		super()
		self.aumentarFortaleza(self.cantidadDeAparatos())
	}
}

class PacienteCaprichoso inherits Paciente{
	method algunAparatoEsRojo(unaRutina){
		return unaRutina.any({a => a.color() == "rojo"})
	}
	override method puedeHacerLaRutina(){
		return super() and self.algunAparatoEsRojo(rutina)
	}
	override method tomarRutina(){
		super()
		super()
	}
}

class PacienteRecuperado inherits Paciente{
	var property recuperacion = 3
	
	override method tomarRutina(){
		super()
		self.disminuirDolor(recuperacion)
	}
}

