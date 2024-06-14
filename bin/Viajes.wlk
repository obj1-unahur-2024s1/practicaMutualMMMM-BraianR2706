import Socios.*
class Viajes{
	var property idiomas = [ ]
	method esfuerzo()
	method bronceado()
	method dias()
	method interesante() = idiomas.size() >= 2
	method recomendada(socio) = self.interesante() and socio.atraeActv(self) and not socio.actividadesRealizadas().contains(self)

}

class ViajePlaya inherits Viajes{
	var largoPlaya
	override method esfuerzo() = largoPlaya >= 1200
	override method bronceado() = true
	override method dias(){
		return largoPlaya / 500
	}
}

class ExcursionCiudad inherits Viajes{
	var atracciones
	override method dias() = atracciones / 2
	override method esfuerzo() = atracciones.between(5,8)
	override method bronceado() = false
	override method interesante() = atracciones == 5 or super()
}

class ExcursionCiudadTropical inherits ExcursionCiudad{
	override method dias() = (atracciones / 2) + 1
	override method bronceado() = true
}

class Trekkling inherits Viajes{
	var kilometros
	var diasSol
	override method dias() = kilometros / 50
	override method esfuerzo() = kilometros > 80
	override method bronceado() = diasSol > 200 or diasSol.between(100,200) and kilometros > 120
	override method interesante() = diasSol > 140 and super()
}

class Gimnasia inherits Viajes{
	const idioma = ["español"]
	override method dias() = 1
	override method esfuerzo() = true
	override method bronceado() = false
	override method recomendada(socio) = socio.edad().between(20,30)
}

class TallerLiterario inherits Viajes{
	const property libros = [ ]
	override method idiomas() = libros.idioma()
	override method dias() = libros.size() + 1
	override method esfuerzo() = libros.any({libro => libro.cantPag() >= 500}) or (self.todosMismoAutor() and libros.size() > 1)
	method todosMismoAutor() = self.mismoAutor().size() == 1
	method mismoAutor() = libros.map({libro => libro.autor()}).asSet()
	override method bronceado() = false
	override method recomendada(socio) = socio.hablaIdioma().size() > 1
}

class Libro{
	const idioma
	const cantPag
	const autor
}