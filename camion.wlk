import cosas.*

object camion {
    const carga = []
    method cargarCosa(unaCosa){
        carga.add(unaCosa)
    }
    method descargarCosa(unaCosa){
        carga.remove(unaCosa)
    }
    
    method peso() = 1000 + carga.sum( {a=>a.peso()} )
    method pesosPares() = carga.all( {a=>a.peso().even()} )
    method hayAlgoDePeso(unPeso) = carga.any( {a=>a.peso() == unPeso} )
}