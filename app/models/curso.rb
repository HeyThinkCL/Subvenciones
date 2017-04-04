class Curso < ApplicationRecord
  belongs_to :grado,:foreign_key => "grados_id"
  has_many :alumnos,:foreign_key =>  "cursos_id"
  has_many :horas,:foreign_key =>  "cursos_id"
end
