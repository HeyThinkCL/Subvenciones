asginaturas = [
  "Lenguaje",
  "Ingles",
  "Matematica",
  "Ciencias Naturales",
  "Historia y Ciencias Sociales",
  "Artes Visuales",
  "Tecnologia",
  "Musica",
  "Educacion Fisica",
  "Religion",
  "Orientacion"
]

asginaturas.each do |asignatura|
  a = Asignatura.new
  a.nombre=asignatura
  a.save()

end
