class CreateJoinTableOtrasHorasCursos < ActiveRecord::Migration[5.0]
  def change
    create_join_table :otras_horas, :cursos do |t|
      # t.index [:otras_hora_id, :curso_id]
      # t.index [:curso_id, :otras_hora_id]
      t.belongs_to :cursos, foreign_key: true
      t.belongs_to :otras_horas, foreign_key: true
    end
  end
end
