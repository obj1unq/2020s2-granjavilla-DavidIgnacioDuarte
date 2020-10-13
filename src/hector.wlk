import wollok.game.*
import jardin.*
import cultivos.*
import mercado.*
import aspersor.*


object hector {
	
var property position = new Position(x = 3, y = 3)
const property image = "player.png"
const plantasParaVender = #{}
var oro = 0
	
	
	method sembrar(planta) {
		planta.position(self.position())
		jardin.agregarPlanta(planta)
	}
	
	method regar() {
		jardin.regar(self.position())
	}
	
	method cosechar() {
		jardin.cosechar(self)
	}
	
	method agregarParaVender(planta) {
		plantasParaVender.add(planta)
	}
	
	method vender() {
		const precio = plantasParaVender.sum({planta => planta.precio()})
		const mercado = mercados.at(self.position())
		mercado.comprar(plantasParaVender, precio)
		oro += precio    
		plantasParaVender.clear()
	}
	
	method decirPosesiones() {
		game.say(self, "Tengo " + oro.toString() + " monedas y " + plantasParaVender.size().toString() + " plantas para vender")
	}
	
	method comprar(aspersor) {
		const mercado = mercados.at(self.position())
		self.validarMontoParaComprar(aspersor)
		mercado.vender(aspersor)
		oro -= aspersor.precio()
		aspersores.agregarAspersor(aspersor)
	}
	
	method colocarAspersorDe(frecuencia) {
		aspersores.colocarEn(frecuencia, position)
	}
	
	method validarMontoParaComprar(aspersor) {
		if(aspersor.precio() > oro) {
			self.error("No tengo suficiente oro para comprar el aspersor de frecuencia " + aspersor.frecuencia().toString())
		}
	}
	
}