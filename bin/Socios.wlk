import Viajes.*
class Socios{
	const property actividadesRealizadas = [ ]
	const maximasActividades 
	const edad
	const hablaIdioma = [ ]
	method adoraSol() = actividadesRealizadas.all({actv => actv.bronceado()})
	method actvEsforzosas() = actividadesRealizadas.filter({actv => actv.esfuerzo()})
	method registrarActividad(actv){
		if(actividadesRealizadas.size() <= maximasActividades) actividadesRealizadas.add(actv) else self.error("limite de actividades alcanzado")
	}
	method atraeActv(actv)
}

class SocioTranquilo inherits Socios{
	override method atraeActv(actv) = actv.dias() >= 4 
}

class SocioCoherente inherits Socios{
	override method atraeActv(actv) = if( self.adoraSol() ) actv.bronceado() else actv.esfuerzo() 
}

class SocioRelajado inherits Socios{
	override method atraeActv(actv) = actv.idiomas().contains(hablaIdioma)
}

