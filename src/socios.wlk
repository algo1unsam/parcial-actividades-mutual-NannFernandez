import viajes.*

class Socio {
	
	var property limiteActividad
	var actividades = []
	var property edad
	var idiomas = []
	
	method agregar(actividad){
		if(limiteActividad >= actividades.size())
			throw new Exception("excedio el limite de actividades")
		actividades.add(actividad)
	}
	
	method adoraElSol(){
		actividades.all{actividad=>actividad.sirveBroncearse()}
	}
	
	method actividadesEsforzadas(){
		actividades.filter{actividad=>actividad.implicaEsfuerzo()}
	}
	
	method leAtrae(actividad){
		return false
	}
}

class Tranquilo inherits Socio {
	
	override method leAtrae(actividad){
		return actividad.diasActividad() >= 4 
	}
}

class Coherente inherits Socio {
	
	override method leAtrae(actividad){
		return actividad.sirveBroncearse() && actividad.implicaEsfuerzo() 
	}
}

class Relajado inherits Socio {
	
	override method leAtrae(actividad){
		return actividad.idioma() 
	}
}