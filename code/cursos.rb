cursos =["A","B"]
Grado.all.each do |grado|
  cursos.each do |curso|
    c = Curso.new()
    c.letra = curso
    c.grado = grado
    c.inasistencias = rand(0..8)
    c.cantidad_alumnos=30 +rand(0..15)
    c.save()
  end

end
