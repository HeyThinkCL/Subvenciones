class Grado < ApplicationRecord
  has_many :cursos,:foreign_key => "grados_id"
  has_many :valores,:foreign_key => "grados_id"
end
