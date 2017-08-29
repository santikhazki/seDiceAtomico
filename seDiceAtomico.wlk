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
	
	method agregarCentral(unaCentral){
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
	
	method estaEnElHorno(){
		return self.lasCentralesContaminantesAportanMucho() || self.todasLasCentralesSonContaminantes()
	}
	
	method lasCentralesContaminantesAportanMucho(){
		return self.loQueProducenLasQueContaminan() > (necesidadEnergetica / 2)
	}
	
	method loQueProducenLasQueContaminan(){
		return (self.lasCentralesQueContaminan()).sum({ central => central.produccionEnergetica() })
	}
	
	method todasLasCentralesSonContaminantes(){
		return centrales.all({ central => central.contaminacion() })
	}
	
	method laCentralQueMasProduce(){
		return centrales.max({ central => central.produccionEnergetica()})
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

object albuquerque {
	var caudalDelRio = 150
	var centrales = [centralHidroelectrica]
	
	method caudalDelRio(){
		return caudalDelRio
	}
	
	method agregarCentral(unaCentral){
		centrales.add(unaCentral)
	}
	
	method quitarCentral(unaCentral){
		centrales.remove(unaCentral)
	}
	
	method laCentralQueMasProduce(){
		return centrales.max({ central => central.produccionEnergetica() })
	}
}

object centralHidroelectrica{
	 var ciudadEnLaQueEsta = albuquerque
	
	method nombre(){
		return "Unica Central De Albuquerque"
	}
	
	method produccionEnergetica(){
		return 2000000 * ciudadEnLaQueEsta.caudalDelRio()
	}
}	

object simpsonsLandia{
	var ciudades = [springfield,albuquerque]
	
	method agregarCiudad(unaCiudad){
		ciudades.add(unaCiudad)
	}
	
	method quitarCiudad(unaCiudad){
		ciudades.remove(unaCiudad)
	}
	
	method lasQueMasProducenDeCadaCiudad(){
		return ciudades.map({ciudad => ciudad.laCentralQueMasProduce()})
	}
	
	method laMadreDeTodasLasCentrales(){
		return (self.lasQueMasProducenDeCadaCiudad()).max({ central => central.produccionEnergetica() })
	}
}
	



