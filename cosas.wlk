object knightRider{
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee{
    method peso() = 800
    var esUnAuto = true
    method peligrosidad(){
        if(esUnAuto){
            return 15
        }
        else{
            return 30
        }
    }
    method transformar(){
        esUnAuto = not esUnAuto
    }
    }

object paqueteLadrillos{
    var cantidadLadrillos = 0
    method peso() = cantidadLadrillos * 2
    method peligrosidad() = 2
    method cargarLadrillos(cantidad){
        cantidadLadrillos = cantidad
    }
}

object arenaGranel{
    var property peso = 0
    method peligrosidad() = 1
}

object bateriaAntiaerea{
    var tieneMisiles = false

    method cargar(){
        tieneMisiles = true
    }

    method descargar(){
        tieneMisiles = false
    }

    method peso(){
        if(tieneMisiles){
            return 300
        }
        else{
            return 200
        }
    }
    method peligrosidad(){
        if(tieneMisiles){
            return 100
        }
        else{
            return 0
        }
    }
}

object contenedorPortuario{
    const contenido = []
    method cargarCosa(unaCosa){
        contenido.add(unaCosa)
    }
    method peso() = 100 + contenido.sum({ p=>p.peso() })
    
    method peligrosidad(){
        if(contenido.size() == 0){
            return 0
        }
        else{
            return contenido.max({ p=>p.peligrosidad() }).peligrosidad()
        }
    }
}

object residuosRadioactivos{
    var property peso = 0
    method peligrosidad() = 200
}

object embalajeDeSeguridad{
    var property cosaEmbalada = null
    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peligrosidad()/2
    
}