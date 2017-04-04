module EstimadoresHelper

  def sumar_costo(hora)
    @costo = @costo +hora.horas*(hora.profesor.remuneracion/ hora.profesor.horas)
    return 2
  end
end
