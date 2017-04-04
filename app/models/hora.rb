class Hora < ApplicationRecord


  belongs_to :curso,:foreign_key =>  "cursos_id"
  belongs_to :asignatura,:foreign_key =>  "asignaturas_id"
  belongs_to :profesor,:foreign_key =>  "profesores_id"


end
