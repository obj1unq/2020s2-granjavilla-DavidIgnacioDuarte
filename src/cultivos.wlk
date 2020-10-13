import wollok.game.*

class Maiz {
	
var property position = null
var esAdulto = false
	
	
	method regar() {
		esAdulto = true
	}
	
	method image() {
		return if (esAdulto) "corn_adult.png" else "corn_baby.png"
	}
	
	method cosechable() {
		return esAdulto
	} 
	
	method precio() {
		return 150
	}
	
}



class Trigo {
	
var property position = null
var etapa = 0
	
	
	method image() {
		return "wheat_" + etapa.toString() + ".png"
	}
	
	method regar() {
		etapa = (etapa + 1) % 4
	}
	
	method cosechable() {
		return etapa >= 2
	}
	
	method precio() {
		return ((etapa - 1) * 100).max(0)
	}
	
}

class Tomaco {
	
const property image = "tomaco.png"
var property position = null	
	
	
	method regar() {
		if(position.y() != game.height() - 1) {
			position = position.up(1)
		}
		else {
			position = game.at(position.x(), 0)
		}
	}
	
	method cosechable() {
		return true
	}
	
	method precio() {
		return 80
	}
}


