import socios.*

class Actividades {
	
	var idiomas = []
	
	method agregar(idioma){
		idiomas.add(idioma)
	}
	
	method obtenerIdiomas(){
		return idiomas
	}
    
    method implicaEsfuerzo(){
    	return false
    }
    method sirveBroncearse(){
    	return false
   	}
    method diasActividad(){
    	return 0
    }
    
    method esInteresante(){
    	return idiomas.size()>1
    }
    
    method esRecomendadaPara(socio){
    	return self.esInteresante() && socio.leAtrae() && !socio.actividades() // falta parametro a leAtrae, actividades() no es booleano
    }
}

class Playa  inherits Actividades {
	
	var property largo
	
	override method diasActividad(){
    	return largo/500
    }
    
    override method implicaEsfuerzo(){
    	return largo > 1200
    }		
    override method sirveBroncearse(){
    	return true
    }
}

class ExcursionCiudad inherits Actividades {
	
	var property cantidadAtracciones 
	
	override method diasActividad(){
		return cantidadAtracciones / 2
	}
	
	override method implicaEsfuerzo(){
		return cantidadAtracciones > 5
	}
	
	override method sirveBroncearse(){
		return false
	}
	
	 override method esInteresante(){
	 	return super() && cantidadAtracciones == 5
	 }
}

class ExcursionTropical inherits ExcursionCiudad {
	
	override method diasActividad(){
		return super()+1
	}
	
	override method sirveBroncearse(){
		return true
	}
}

class SalidaDeTrekking inherits Actividades {
	
	var property kilometrosSendero
	var property diasDeSol
	
	override method diasActividad(){
		return  kilometrosSendero / 50
	}
	
	override method implicaEsfuerzo(){
		return kilometrosSendero > 80
	}
	
	override method sirveBroncearse(){
		return diasDeSol >= 200 && kilometrosSendero >= 120
	}
	
	override method esInteresante(){
		return super() && diasDeSol > 120	
	 }
} 

class Gimnasia inherits Actividades {
	
	override method obtenerIdiomas(){
    	return ["español"]
    }
	
	override method diasActividad(){
		return 1
	}
	
	override method implicaEsfuerzo(){
		return true
	}
	
	override method sirveBroncearse(){
		return false
	}
	
	override  method esRecomendadaPara(socio){
		return socio.edad() < 20 
	}
	
}
