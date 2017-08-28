object springfield {
	var vientos = 10
	var riquezaDelSuelo = 0.9
	var necesidadEnergetica = 10
	var centrales = [centralAtomica,centralDeCarbon,centralEolica]
	
	method vientos(){
		return vientos
	}
	
	method riquezaDelSuelo(){
		return riquezaDelSuelo
	}
	
	method necesidadEnergetica(){
		return necesidadEnergetica
	}
	
	method agregarCentrales(unaCentral){
		centrales.add(unaCentral)
	}
	
	method quitarCentral(unaCentral){
		centrales.remove(unaCentral)
	}
	
	method cuantoProduce(unaCentral){
		return unaCentral.produccionEnergetica()
	}
	
	method lasCentralesQueContaminan(){
		return centrales.filter({central => central.contaminacion()})
	}
	
	method cantDeEnergiaProducida(){
		return centrales.sum({ central => central.produccionEnergetica() })
	}
	
	method cubrioSusNecesidades(){
		return  self.cantDeEnergiaProducida() > necesidadEnergetica
	}
	
	method loQueProducenLasQueContaminan(){
		return (self.lasCentralesQueContaminan()).sum({ central => central.produccionEnergetica() })
	}
	
	method estaEnElHorno(){
		return self.lasCentralesContaminantesAportanMucho() || self.todasLasCentralesSonContaminantes()
	}
	
	method lasCentralesContaminantesAportanMucho(){
		return self.loQueProducenLasQueContaminan() > (necesidadEnergetica / 2)
	}
	
	method todasLasCentralesSonContaminantes(){
		return centrales.all({ central => central.contaminacion() })
	}
}
	
object centralAtomica {
	var varillasDeUranio = 0
	var ciudadEnLaQueEsta = springfield
	
	method ciudadEnLaQueEsta(){
		return ciudadEnLaQueEsta
	}
	
	method nombre(){
		return "Burns"
	}
	
	method varillasDeUranio(unaCantidad){
		 varillasDeUranio = unaCantidad
	}
	
	method varillasDeUranio(){
		return varillasDeUranio 
	}
	
	method produccionEnergetica(){
		return 0.1 * varillasDeUranio
	}
	
	method contaminacion (){
		return varillasDeUranio > 20
	}
}

object centralDeCarbon {
	var capacidadEnToneladas = 0
	var ciudadEnLaQueEsta = springfield
	
	method nombre(){
		return "Ex-Bosque"
	}
	
	method ciudadEnLaQueEsta(){
		return ciudadEnLaQueEsta
	}
	
	method capacidadEnToneladas(unaCantidad){
		capacidadEnToneladas = unaCantidad
	}
	
	method capacidadEnToneladas(){
		return capacidadEnToneladas
	}
	
	method produccionEnergetica(){
		return 0.5 + (capacidadEnToneladas * ciudadEnLaQueEsta.riquezaDelSuelo())
	}
	
	method contaminacion(){
		return true
	}
}

object centralEolica {
	var cantidadDeTurbinas = 0
	var ciudadEnLaQueEsta = springfield
	
	method nombre(){
		return "El Suspiro"
	}
	
	method ciudadEnLaQueEsta(){
		return ciudadEnLaQueEsta
	}
	
	method cantidadDeTurbinas(unaCantidad){
		cantidadDeTurbinas = unaCantidad
	}
	
	method cantidadDeTurbinas(){
		return cantidadDeTurbinas
	}
	
	method produccionEnergetica(){
		return cantidadDeTurbinas * (0.2 * ciudadEnLaQueEsta.vientos()) 
	}
	
	method contaminacion(){
		return false
	}
}


