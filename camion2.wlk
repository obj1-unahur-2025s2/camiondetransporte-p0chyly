import cosas.*

object camion {
    const carga = []

    method bultos() = carga.sum({unaCosa => unaCosa.bultosOcupados()})

    method cargarCosa(unaCosa){
        unaCosa.sufrirCambios()
        const cosaCambiada = unaCosa
        carga.add(cosaCambiada)
    }

    method descargarCosa(unaCosa){
        carga.remove(unaCosa)
    }
    method peso() = 1000 + carga.sum( {a=>a.peso()} )
   
    method pesosPares() = carga.all( {a=>a.peso().even()} )
   
    method hayAlgoDePeso(unPeso) = carga.any( {a=>a.peso() == unPeso} )
    
    method loPrimeroConPeligrosidad(nivelPeligrosidad) =
    carga.find( {a=>a.peligrosidad() == nivelPeligrosidad} )
    
    method cargaConPeligrosidadMayorA(nivelPeligrosidad) = 
    carga.filter( {a=>a.peligrosidad() > nivelPeligrosidad} )
    
    method tieneCargaConPesoEntre(pesoMin, pesoMax) = 
    carga.any( { unaCosa => unaCosa.peso().between(pesoMin, pesoMax) } )
    
    method cosaMasPesada() = carga.max( {a=>a.peso()} )
    
    method estaExcedido() = self.peso() > 2500
    
    method puedeCircularEnRuta(nivelPeligrosidad) = 
    (not self.estaExcedido()) and 
    self.cargaConPeligrosidadMayorA(nivelPeligrosidad).isEmpty()

}

