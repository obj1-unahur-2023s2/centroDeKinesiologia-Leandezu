class Paciente{
	var edad
	var fortalezaMuscular
	var nivelDeDolor
	
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
}

class Magneto{
	method aplicarEfectos(paciente){
		paciente.disminuirDolor(paciente.nivelDeDolor() * 0.1)
	}
	method puedeSerUsado(paciente){
		return true
	}
}

class Bicicleta{
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

