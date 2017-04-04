class Alumno < ApplicationRecord

  belongs_to :curso,:foreign_key => 'cursos_id'
end
