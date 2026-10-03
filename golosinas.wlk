class Golosinas {
    var peso() = peso
    method esLibreDeGruten() = false 
    method precio()
    method sabor()
    method recibirMordisco()
}


class bombon inherits Golosina( peso = 15) {
    override method precio() = 5
    override method sabor() = frutilla
    override method esLibreDeGluten() = true
    method recibirMordisco() {
        peso = ((peso * 0.8) - 1).max(0)
    }
}


class alfajor inherits Golosina(peso = 300){ //Lo hereda de golosina al peso y al esLibreDeGluten
    override method precio() = 12
    override method sabor() = chocolate
    override method recibirMordisco() {
        peso = peso * 0.8
    }    
}

class caramelo inherits Golosina(peso = 5){
    override method precio() = 1
    override method sabor() = frutilla
    override method esLibreDeGluten() = true
    override method recibirMordisco() {
        peso = (peso - 1).max(0)
    }
}

class chupetin inherits Golosina(peso = 7) {
    method precio() = 2
    method sabor() = naranja
    method esLibreDeGluten() = true
    method recibirMordisco() {
        peso = peso - peso * 0.1 * peso.div(2).min(1)
        // if (peso >= 2) { peso = peso * 0.9 }
    }
}

class oblea inherits Golosina(peso = 250) {
    override method precio() = 5
    override method sabor() = vainilla
    override method esLibreDeGluten() = false
    override method recibirMordisco() {
        peso = 0.max(peso - if(peso>70) peso * 0.5 else peso * 0.25) 
    }
}

class chocolatin inherits Golosina(peso = 0) {
    const pesoInicial = 0
    var gramosConsumidos = 0
    method setPesoInicial(unValor) {pesoInicial = unValor}
    override method peso() = 0.max(pesoInicial - gramosConsumidos)
    override method precio() = 0.5 * pesoInicial
    override method sabor() = chocolate
    override method recibirMordisco() {
        gramosConsumidos += 2 
    }  
}

class GolosinaBaniada inherits Golosina(peso = 0) {
    const golosinaBase // la golosinaBase no cambia
    var gramosDeBaniado = 4
    }
    override method precio() = golosinaBase.precio() + 2
    override method peso() = golosinaBase.peso() + gramosDeBaniado
    override method sabor() = golosinaBase.sabor()
    override method esLibreDeGluten() = golosinaBase.esLibreDeGluten()
    override method recibirMordisco() {
        golosinaBase.recibirMordisco()
        gramosDeBaniado = (gramosDeBaniado - 2).max(0)
    }  
}

class pastillaTuttiFrutti inherits Golosina(peso=5) {
    const esLibreDeGluten 
    const sabor = frutilla
    override method precio() = if(esLibreDeGluten) 7 else 10
    override method esLibreDeGluten() = esLibreDeGluten
    override method sabor() = sabor
    override method recibirMordisco() {
        sabor = sabor.siguienteSabor()
    }
}

object pastillaTuttiFrutti2 inherits Golosina(peso = 5) {
    var esLibreDeGluten = false
    var mordiscos = 0
    const sabores = [frutilla,chocolate,naranja]
    override method precio() = if(esLibreDeGluten) 7 else 10
    override method esLibreDeGluten() = esLibreDeGluten
    override method sabor() = [frutilla,chocolate,naranja].get(mordiscos%sabores.size()) //resto de la division entera
    override method recibirMordisco() {
        mordiscos += 1
    }
}

object frutilla { method siguienteSabor() = chocolate }

object chocolate { method siguienteSabor() = naranja }

object naranja { method siguienteSabor() = frutilla }

object vainilla { }

class BombonDuro inherits Bombon {
    override method recibirMordisco() {
        peso = (peso - 1).max(0)
    }
    method gradoDeDureza() = 1 + if(peso > 12) 2 else if(peso >= 8) 1 else 0 // le suma 2,1 o 0 segun cumpla
    method gradoDurezaPro() = 1 + [peso >= 8, peso > 12].count({cumple -> cumple})
}

class CarameloDeSabor inherits Caramelo {
    const sabor
    override method sabor() = sabor
}

class CarameloRelleno inherits Caramelo {
    var sabor = frutilla
    override method sabor() = sabor 
    override method recibirMordisco() {
        super()
        sabor = chocolate
    }
    override method precio() = super() + 1
}

class ObleaCrujiente inherits Oblea {
    var mordiscos = 0
    override method recibirMordisco() {
        super()
        peso = peso - if(mself.estaDebil()) 3 else 0
        mordiscos += 1 
    }
    method estaDebil() = mordiscos > 3
}

class ChocolatinVIP inherits Chocolatin {
    override method peso() = super() * (1 + self.humedad())
    method humedad() = heladeraDeMariano.coeficienteDeHumedad()
}

class chocolatinPremium inherits ChocolatinVIP {
    override method humedad() = heladeraDeMariano.coeficienteDeHumedad / 2
    
} 

object heladeraDeMariano {
    var coeficienteDeHumedad = 0
    method cambiarCoeficienteDeHumedad(nuevoValor) {
        coeficienteDeHumedad = 0.max(nuevoValor).min(1)
    }
    method coeficienteDeHumedad() = coeficienteDeHumedad
}

