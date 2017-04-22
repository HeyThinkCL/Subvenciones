class DashboardController < ApplicationController
  def ingresos

    ingreso = 0
    Curso.all.each do |curso|


    @perdida = (curso.grado.valores.inject(0){|sum,x| sum + x.precio/session[:dias_habiles] } )*curso.inasistencias/100
    @maximo = curso.grado.valores.inject(0){|sum,x| sum + x.precio }*(curso.cantidad_alumnos)/100

    ingreso =ingreso+( @maximo - @perdida)
    end
    return ingreso
  end
  def index


    @ingreso_total =ingresos()


    @data = {
        labels: ["Enero", "Febrero", "Marzo", "April", "Mayo", "Junio", "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
        datasets: [
            {
                label: "Subvencion Base",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderColor: "rgba(220,220,220,1)",
                data: [0, 0, 80, 81, 0, 0, 0,0, 0, 0, 0, 0, 0, 0]
            },
            {
                label: "Pie",
                backgroundColor: "rgba(151,187,205,0.2)",
                borderColor: "rgba(151,187,205,1)",
                data: [0, 0, 50, 19, 0, 0, 0,0, 0, 0, 0, 0, 0, 0]
            },
            {
                label: "Sep",
                backgroundColor: "rgba(251,87,205,0.2)",
                borderColor: "rgba(151,187,205,1)",
                data: [0, 0, 40, 19, 0, 0, 0,0, 0, 0, 0, 0, 0, 0]
            },
            {
                label: "Prioritarios",
                backgroundColor: "rgba(251,87,205,0.2)",
                borderColor: "rgba(151,187,205,1)",
                data: [0, 0, 30, 10, 0, 0, 0,0, 0, 0, 0, 0, 0, 0]
            }
        ]
    }
    @options = {}

=begin

    @data2 = {
        labels: ["Asistencia", "Inasistencia"],
        datasets: [
            {
                label: "Pie",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderColor: "rgba(220,220,220,1)",
                data: [65, 59]
            },
            {
                label: "Sep",
                backgroundColor: "rgba(151,187,205,0.2)",
                borderColor: "rgba(151,187,205,1)",
                data: [28, 48]
            },
            {
        label: "Subvencion Base",
        backgroundColor: "rgba(220,220,220,0.2)",
        borderColor: "rgba(220,220,220,1)",
        data: [65, 59]
    }
        ]
    }
=end

    @data2 =  {
        datasets: [{
                       data: [
                           11,
                           16,
                           7,
                           3
                       ],
                       backgroundColor: [
                           "#FF6384",
                           "#4BC0C0",
                           "#FFCE56",
                           "#36A2EB"
                       ],
                       label: 'My dataset'
    }],
    labels: [
        "Subvencion Base",
        "Pie",
        "Preferente",
        "Prioritario"]
       }
    @options = {}

  end

  def goto
    redirect_to action:index
  end

end
