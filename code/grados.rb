niveles = [
    [
        "1",
        "Primero Básico",
        "basico"
    ],
    [
        "2",
        "Segundo Básico",
        "basico"
    ],
    [
        "3",
        "Tercero Básico",
        "basico"
    ],
    [
        "4",
        "Cuarto Básico",
        "basico"
    ],
    [
        "5",
        "Quinto Básico",
        "basico"
    ],
    [
        "6",
        "Sexto Básico",
        "basico"
    ],
    [
        "7",
        "Septimo Básico",
        "basico"
    ],
     [
        "8",
        "Octavo Básico",
        "basico"
    ],
    [
        "1",
        "Pre-Kinder",
        "kinder"
    ],
    [
        "2",
        "Kinder",
        "kinder"
    ],
    [
        "1",
        "Primero Medio",
        "media"
    ],
    [
        "2",
        "Segundo Medio",
        "media"
    ],
    [
        "3",
        "Tercero Medio",
        "media"
    ],
    [
        "4",
        "Cuarto Medio",
        "media"
    ]


]

niveles.each do |nivel|
  grado = Grado.new()
  grado.nivel = nivel[0]
  grado.estado=nivel[2]
  grado.grado =nivel[1]
  grado.save()
end