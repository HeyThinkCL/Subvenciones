
28.times do |i|


 Asignatura.all
     .each do |asignatura |
   h = Hora.new
h.cursos_id = i+1
h.profesores_id =  rand(1..8)
h.asignaturas_id =  asignatura.id
h.horas = rand(1..8)
   h.save
  end

end

