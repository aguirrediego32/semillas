class Planta {

	var property anioDeObtencion
	var property altura

	method horasDeToleranciaAlSol() {
		return 1
	}

	method esFuerte() {
		return self.horasDeToleranciaAlSol() > 10
	}

	method daNuevasSemillas() {
		return self.esFuerte()
	}

	method espacioQueOcupaEnMetros() {
		return 1
	}

	method esParcelaIdeal(parcela)

}

class Menta inherits Planta {

	override method horasDeToleranciaAlSol() = 6

	override method daNuevasSemillas() {
		return super() or altura > 0.4
	}

	override method espacioQueOcupaEnMetros() {
		return altura * 3
	}

	override method esParcelaIdeal(parcela) {
		return parcela.superficie() > 6
	}

}

class Soja inherits Planta {

	override method horasDeToleranciaAlSol() {
		if (altura < 0.5) {
			return 6
		}
		if (altura.between(0.5, 1)) {
			return 7
		} else {
			return 9
		}
	}

	override method esParcelaIdeal(parcela) {
		return parcela.horasDeSolAlDia() == self.horasDeToleranciaAlSol()
	}

	override method daNuevasSemillas() {
		return super() or anioDeObtencion > 2007 and altura > 1
	}

	override method espacioQueOcupaEnMetros() {
		return altura / 2
	}

}

class Quinoa inherits Planta {

	var cantDeHorasDeSol

	override method horasDeToleranciaAlSol() = cantDeHorasDeSol

	override method espacioQueOcupaEnMetros() {
		return 0.5
	}

	override method daNuevasSemillas() {
		return super() or anioDeObtencion < 2005
	}

	override method esParcelaIdeal(parcela) {
		return parcela.plantas().all{ planta => planta.altura() <= 1.5 }
	}

}

class SojaTransgenica inherits Soja {

	override method daNuevasSemillas() = false

	override method esParcelaIdeal(parcela) {
		return parcela.cantMaximasDePlantas() == 1
	}

}

class HierbaBuena inherits Menta {

	override method espacioQueOcupaEnMetros() {
		return super() * 2
	}

}

