class Valor < ApplicationRecord
  belongs_to :grado, :foreign_key => 'grados_id'
  belongs_to :subvencion,:foreign_key => "subvenciones_id"
end
