import wollok.game.*
import jardin.*


class Aspersor {
	
var property position = null
const property image = "aspersor.png"
var property frecuencia = null
const frecuenciaMaxima = 5
    		
    		
 	method regar() {
		jardin.regarVecinos(self.position())
	}
	
	method precio() {
		return (frecuenciaMaxima / frecuencia) * 1000
	}
	//FRECUENCIA 5 : $1000
	//FRECUENCIA 2 : $2500
	//FRECUENCIA 1 : $5000
	
	
}



object aspersores {
	
const property todos = #{}
const property inGame = #{}
	
	
	method agregarAspersor(aspersor) {
		todos.add(aspersor)
	}
	
	method colocarEn(frecuencia, posicion) {
		const aspersorAColocar = self.aspersorAColocar(frecuencia)
		aspersorAColocar.position(posicion)
		inGame.add(aspersorAColocar)
		game.addVisualIn(aspersorAColocar, posicion)
		game.onTick(frecuencia * 1000, "Riego del Aspersor", {aspersorAColocar.regar()})
		todos.remove(aspersorAColocar)
	}
	
	method aspersorAColocar(frecuencia) {
		return todos.findOrElse({aspersor => aspersor.frecuencia() == frecuencia}, {self.error("No se compró un aspersor de frecuencia " + frecuencia.toString()) ; null})
	}
	
}
