module CursosHelper

  def pie_curso(curso)

    monto = curso.grado.valores.inject(0){|sum,x| sum + x.precio }*(curso.cantidad_alumnos)/100
    perdida = (curso.grado.valores.inject(0){|sum,x| sum + x.precio/@dias } )*curso.inasistencias/100

    @data = {
        labels: [
            "Sub. No percibida",
            "Ingresos"
        ],
        datasets: [
            {
                data: [ perdida.to_i,monto.to_i- perdida.to_i],
                backgroundColor: [
                    "#FF6384",
                     "#36A2EB"

                ],
                hoverBackgroundColor: [
                    "#FF6384",
                    "#36A2EB"

                ]
            }]
    }


  end

  def monto_maximo(curso)
    return  curso.grado.valores.inject(0){|sum,x| sum + x.precio }*(curso.cantidad_alumnos)/100
  end
end
