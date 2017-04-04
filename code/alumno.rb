dias = 23

Curso.all.each do |curso|

    alumno = Alumno.new()

    subvencion = Subvencion.where(:sigla => "SB").first()
    d = alumno.alumnos  = curso.cantidad_alumnos
    alumno.curso = curso
    alumno.subvenciones_id = subvencion.id
    alumno.inasistencias = rand(0..15)
    alumno.asistencias = curso.cantidad_alumnos*dias-alumno.inasistencias
    alumno.save()

    curso.inasistencias = alumno.inasistencias


    subvencion = Subvencion.where(:sigla => "PIE").first()
    alumno = Alumno.new()
    f = alumno.alumnos  = rand(0..4)
    alumno.inasistencias = rand(0..curso.inasistencias)
    alumno.asistencias = f*dias-alumno.inasistencias
    alumno.curso = curso
    alumno.subvenciones_id = subvencion.id
    alumno.save()

    subvencion = Subvencion.where(:sigla => "SEP").first()
    alumno = Alumno.new()



    alumno.alumnos  = rand(0..d)-f + rand(0..f)
    alumno.inasistencias = rand(0..curso.inasistencias)
    alumno.asistencias = alumno.alumnos*dias-alumno.inasistencias
    alumno.curso = curso
    alumno.subvenciones_id = subvencion.id

    alumno.save()
    curso.save()


    subvencion = Subvencion.where(:sigla => "Prioritarios").first()
    alumno = Alumno.new()



    alumno.alumnos  = rand(0..d)-f + rand(0..f)
    alumno.inasistencias = rand(0..curso.inasistencias)
    alumno.asistencias = alumno.alumnos*dias-alumno.inasistencias
    alumno.curso = curso
    alumno.subvenciones_id = subvencion.id

    alumno.save()
    curso.save()

end


