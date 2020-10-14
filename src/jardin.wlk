import wollok.game.*


object jardin {
	
const property plantas = #{}
	
	
	method agregarPlanta(planta){
		plantas.add(planta)
		game.addVisual(planta)
	}	
	
//	method regarSiHayPlanta(posicion) {
//		const regables = self.plantasEn(posicion)
//		regables.forEach({planta => planta.regar()})
//	}
	
	method regar(posicion) {
		const regables = self.plantasEn(posicion)
		if(regables.isEmpty()) {
			self.error("no tengo plantas que regar")
		}
		regables.forEach({planta => planta.regar()})
	}
	
	method regarVecinos(posicion) {
		const regables = plantas.filter({planta => self.esVecino(planta,posicion)})
		regables.forEach({planta => planta.regar()})
	}
	
	method esVecino(planta, posicion) {
		return planta.position().distance(posicion) < 2
	}
	
	method plantasEn(posicion) {
		return plantas.filter({planta => planta.position() == posicion})
	}
	
	method cosechar(recolector) {
		const cosechables = self.plantasEn(recolector.position()).filter({planta => planta.cosechable()})
		if(cosechables.isEmpty()) {
			self.error("no tengo plantas que cosechar")
		}
		cosechables.forEach({planta => self.cosecharPlanta(planta, recolector)})		
	}
	
	method cosecharPlanta(planta, recolector) {
		plantas.remove(planta)
		game.removeVisual(planta)
		recolector.agregarParaVender(planta)
	}
	
}
