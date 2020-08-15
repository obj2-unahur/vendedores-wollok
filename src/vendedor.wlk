class Certificacion {
  const property esDeProducto
  const property puntaje
}

class Vendedor {
  const certificaciones = []

  method esVersatil() =
    certificaciones.size() >= 3
      && self.certificacionesDeProducto() >= 1
      && self.otrasCertificaciones() >= 1

  method agregarCertificacion(certificacion) {
    certificaciones.add(certificacion)
  }

  method esFirme() = self.puntajeCertificaciones() >= 30

  method certificacionesDeProducto() = certificaciones.count { c => c.esDeProducto() }
  method otrasCertificaciones() = certificaciones.count { c => !c.esDeProducto() }

  method puntajeCertificaciones() = certificaciones.sum { c => c.puntaje() }
}

class VendedorFijo inherits Vendedor {
  const property ciudadOrigen
  
  method puedeTrabajarEn(ciudad) {
    return ciudad == ciudadOrigen
  }
}

class Viajante inherits Vendedor {
  const property provinciasHabilitadas
  
  method puedeTrabajarEn(ciudad) {
    return provinciasHabilitadas.contains(ciudad.provincia())
  }
}

class ComercioCorresponsal inherits Vendedor {
  const property ciudades
  
  method puedeTrabajarEn(ciudad) {
    return ciudades.contains(ciudad)
  }
}
