import golosinas.*

object mariano {
    const golosinas = []
    const golosinasDesechadas = []
    method comprar(unaGolosina) {
        golosinas.add(unaGolosina)
    }
    method comprarVarias(listaDeGolosinas) {
        golosinas.addAll(listaDeGolosinas)
    }

    method desechar(unaGolosina) {
        if(self.tieneLaGolosina(unaGolosina)) {
            golosinas.remove(unaGolosina)
            golosinasDesechadas.add(unaGolosina)
        }
    }

    method cantidadDeGolosinas() = golosinas.size()

    method tieneLaGolosina(unaGolosina) {
        return golosinas.contains(unaGolosina)
    }

    method probarGolosinas() {
        golosinas.forEach({g=>g.recibirMordisco()})
    }

    method hayGolosinaSinTACC() {
        return golosinas.any({g=>g.esLibreDeGluten()})
    }

    method preciosCuidados() {
        return golosinas.all({g=>g.precio() <= 10})
    }

    method golosinaDeSabor(unSabor) {
        return golosinas.findOrDefault({g=>g.sabor() == unSabor}, [])
    }

    method golosinasDeSabor(unSabor) {
        return golosinas.filter({g=>g.sabor() == unSabor})
    }

    method sabores() {
        return golosinas.map({g=>g.sabor()}).asSet()
    }

    method golosinaMasCara() {
        return golosinas.max({g=>g.precio()})
    }

    method pesoGolosinas() {
        return golosinas.sum({g=>g.peso()})
    }

    method golosinasFaltantes(golosinasDeseadas) {
        return golosinasDeseadas.asSet().difference(golosinas.asSet())
    } // si conozco las instancias de las golosinas


    method gustosFaltantes(gustosDeseados) {
        return gustosDeseados.difference(self.saboresComprados())
    }

    method saboresComprados() {
        return golosinas.map({g=>g.sabores()}).asSet()
    }

    method gastoEn(sabor) {
        return self.golosinasDeSabor(sabor).sum({g=>g.precio()})
    }

    method saborMasPopular() {
        return self.saboresComprados().max({sabor => self.golosinasDeSabor(sabor)})
    }

    method saborMasPesado() {
        return self.saboresComprados().max({sabor => self.pesoDe(sabor)})
    }

    method pesoDe(sabor) {
        return self.golosinasDeSabor(sabor).sum({g=>g.peso()})
    }

    method comproYDesecho(golosina) {
        golosinasDesechadas.contains(golosina)
    }


//   Este es con clases
//   method baniar(unaGolosina) {
//       const golosinaBaniada = new GolosinaBaniada(golosinaBase=unaGolosina)
//       self.comprar(golosinaBaniada)
//   }

}