class Aparato{
	var color
	
	method color() = color
	method puedeSerUsado(paciente)
	method aplicarEfectos(paciente){
		if(not self.puedeSerUsado(paciente)){
			self.error("El paciente no puede usar el aparato")
		}
	}
}

class Magneto inherits Aparato{
	var imantacion = 800
	
	override method aplicarEfectos(paciente){
		super(paciente)
		paciente.disminuirDolor(paciente.nivelDeDolor() * 0.1)
		imantacion -= 1
	}
	method necesitaMantenimiento(){
		return imantacion < 100
	}
	override method puedeSerUsado(paciente){
		return not self.necesitaMantenimiento()
	}
	method aplicarMantenimiento(){
		if(self.necesitaMantenimiento()){
			imantacion += 500
		}
	}
}

class Bicicleta inherits Aparato{
	var tornilloDesajustado = 0
	var perdidasDeAceite = 0
	
	override method aplicarEfectos(paciente){
		super(paciente)
		self.aplicarDesgaste(paciente)
		paciente.disminuirDolor(4)
		paciente.aumentarFortaleza(3)
	}
	override method puedeSerUsado(paciente){
		return paciente.edad() > 8
	}
	method aplicarDesgaste(paciente){
		if(paciente.nivelDeDolor() > 30){
			tornilloDesajustado += 1
		}
		if(paciente.edad() > 30 and paciente.edad() < 50){
			perdidasDeAceite += 1
		}
	}
	method necesitaMantenimiento(){
		return tornilloDesajustado >= 10 or perdidasDeAceite >= 5
	}
	method aplicarMantenimiento(){
		if(self.necesitaMantenimiento()){
			tornilloDesajustado = 0
			perdidasDeAceite = 0			
		}
	}
}

class Minitramp inherits Aparato{
	
	override method aplicarEfectos(paciente){
		super(paciente)
		paciente.aumentarFortaleza(paciente.edad() * 0.1)
	}
	override method puedeSerUsado(paciente){
		return paciente.nivelDeDolor() < 20
	}
	method necesitaMantenimiento(){
		return false
	}
	method aplicarMantenimiento(){}
}
