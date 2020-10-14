import wollok.game.*


class Mercado {
		
var property position = null
const property image = "market.png"
    
    
    var property oro
    const property mercaderia = #{}
    
    method validarCompra(precio) {
    	if (oro < precio) {
    		self.error("No me alcanza el dinero")
    	}
    }
    
    method comprar(plantas, precio) {
    	self.validarCompra(precio)
    	mercaderia.addAll(plantas);
    	oro -= precio
    }
    
    method vender(aspersor) {
    	oro += aspersor.precio()
    }
    	
}



object mercados {
	
const property todos = #{}
	
	
 	method at(position) {
 		return todos.findOrElse({mercado => mercado.position() == position}, {self.error("No hay mercados en esta posicion") ; null})
 	}
 	
// 	method at(position) {
//		if (not todos.any({ mercado => mercado.position() == position})) {
//			self.error("No hay mercados en esta posicion")
//		}
//		return todos.find({ mercado => mercado.position() == position })
//	}
// 	
	method agregar(mercado) {
  		todos.add(mercado)
  		game.addVisual(mercado)  	
    }
 	
}