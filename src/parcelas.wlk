import plantas.*

class Parcela {

	var property ancho
	var property largo
	var property plantas = []
	var property horasDeSolAlDia

	method superficie() {
		return ancho * largo
	}

	method cantMaximaDePlantas() {
		return if (ancho > largo) {
			self.superficie() / 5
		} else {
			self.superficie() / 3 + largo
		}
	}

	method tieneComplicaciones() {
		return plantas.any{ planta => planta.horasDeToleranciaAlSol() < horasDeSolAlDia }
	}

	method plantarPlanta(planta) {
		plantas.add(planta)
	}
	
	method cantDePlantas(){
		return plantas.size()
	}

	method poderPlantarUnaPlanta(planta) {
		self.plantarPlanta(planta)
		if (self.cantDePlantas() > self.cantMaximaDePlantas() or horasDeSolAlDia - planta.horasDeToleranciaAlSol() >= 2) {
			self.error("se supero el limite o no es una planta apta")
		}
	}
	
	method porcentajePlantasBienAsociadas(){
		
	}

}

class ParcelaEcologica inherits Parcela {

	method seAsociabien(planta) {
		return not self.tieneComplicaciones() and planta.esParcelaIdeal(self)
	}
	
	override method porcentajePlantasBienAsociadas(){
		return plantas.forEach{planta=>planta}
	}

}

class ParcelaIndustrial inherits Parcela {

	method seAsociabien(planta) {
		return self.cantMaximaDePlantas() == 2 and planta.esFuerte()
	}
	
	

}

object inta{
	var parcelas= []
	
	method totalDeParcelas(){
		return parcelas.size()
	}
	
	method totalDePlantas(){
		return parcelas.sum{parcela=> parcela.cantDePlantas()}
	}
	
	method promedioDePlantas(){
		return self.totalDePlantas() / self.totalDeParcelas()
	}
	
	
	
	method parcelaMasAutosustentable(){
	var parcelaCandidata =	parcelas.filter{parcela=>parcela.cantDePlantas() > 4}
	
	return parcelaCandidata.forEach{parcela=>parcela.seAsociaBien(parcela.)}
	}
	
}

