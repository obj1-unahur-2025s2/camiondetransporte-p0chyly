object knightRider{
    method bultosOcupados() = 1
    method peso() = 500
    method peligrosidad() = 10
    method sufrirCambios(){}
}

object bumblebee{
    method bultosOcupados() = 2
    method peso() = 800
    var esUnAuto = true
    method peligrosidad(){if(esUnAuto) return 15 else return 30}
    method transformar(){esUnAuto = not esUnAuto}
    method sufrirCambios(){esUnAuto = false}
}

object paqueteLadrillos{
    method bultosOcupados(){
        if(cantidadLadrillos <= 100){
            return 1
        }
        else if((cantidadLadrillos >= 101) and (cantidadLadrillos <= 300)){
            return 2
        }
        else{
            return 3
        }
    }
    var cantidadLadrillos = 0
    method peso() = cantidadLadrillos * 2
    method peligrosidad() = 2
    method cargarLadrillos(cantidad){cantidadLadrillos += cantidad}
    method sufrirCambios(){self.cargarLadrillos(12)}
}

object arenaGranel{
    method bultosOcupados() = 1
    var peso = 0
    method peso() = peso
    method cambiarPeso(unPeso){peso += unPeso}
    method peligrosidad() = 1
    method sufrirCambios(){self.cambiarPeso(-10)}
}

object bateriaAntiaerea{
    method bultosOcupados(){if(tieneMisiles) return 2 else return 1}
    var tieneMisiles = false
    method cargar(){tieneMisiles = true}
    method descargar(){tieneMisiles = false}
    method peso() {if(tieneMisiles) return 300 else return 200}
    method peligrosidad(){if(tieneMisiles) return 100 else return 0}
    method sufrirCambios(){tieneMisiles = true}
}

object contenedorPortuario{
    method bultosOcupados() = 1 + contenido.sum( {contenido => contenido.bultosOcupados()} )
    const contenido = []
    method cargarCosa(unaCosa) = contenido.add(unaCosa)
    method peso() = 100 + contenido.sum({ p=>p.peso() })
    method peligrosidad(){
        if(contenido.size() == 0){
            return 0
        }
        else{
            return contenido.max({ p=>p.peligrosidad() }).peligrosidad()
        }
    }
    method sufrirCambios() = contenido.forEach({unaCosa => unaCosa.sufrirCambios()})
}

object residuosRadioactivos{
    method bultosOcupados() = 1
    var peso = 0
    method peso() = peso
    method cambiarPeso(unPeso){peso += unPeso}
    method peligrosidad() = 200
    method sufrirCambios(){self.cambiarPeso(15)}
}

object embalajeDeSeguridad{
    method bultosOcupados() = 2
    var property cosaEmbalada = null
    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peligrosidad()/2
    method sufrirCambios(){}
}