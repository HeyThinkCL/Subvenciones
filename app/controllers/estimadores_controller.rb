class EstimadoresController < ApplicationController

  def index


  end
  def create


  end
  def sumar(horas)
    @costo = horas*(hora.profesor.remuneracion/ hora.profesor.horas+@costo)
  end

  def show



    @dias = session[:dias_habiles]




    @curso = Curso.find(params[:id])


    @perdida = (@curso.grado.valores.inject(0){|sum,x| sum + x.precio/@dias } )*@curso.inasistencias/100
    @maximo = @curso.grado.valores.inject(0){|sum,x| sum + x.precio }*(@curso.cantidad_alumnos)/100

    @monto = @maximo - @perdida




    id = params[:id]

    @sb = {
        labels: [
            "Inasistencia",
            "Asistencia",

        ],
        datasets: [
            {
                data: [@curso.inasistencias,@curso.cantidad_alumnos*@dias-@curso.cantidad_alumnos],
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
    @options = {}
    @options2 = {:height => "100"}
    @options3 = {:height => "100"}


    sep = Alumno.where("cursos_id  = #{id} and subvenciones_id = 2 ").first

    @sep = {
        labels: [
            "Inasistencia",
            "Asistencia",

        ],
        datasets: [
            {
                data: [sep['inasistencias'],sep['asistencias']],
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



    prioritarios = Alumno.where("cursos_id  = #{id} and subvenciones_id = 3 ").first

    @prioritarios = {
        labels: [
            "Inasistencia",
            "Asistencia",

        ],
        datasets: [
            {
                data: [prioritarios['inasistencias'],100],
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



    pie = Alumno.where("cursos_id  = #{id} and subvenciones_id = 4 ").first

    @pie = {
        labels: [
            "Inasistencia",
            "Asistencia",

        ],
        datasets: [
            {
                data: [pie['inasistencias'],pie['asistencias']],
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





    @proyeccion = {
        labels: [
            "Enero",
            "Febrero",
            "Marzo",
            "Abril"

        ],
        datasets:[
            {
                label: "Maximo",
                backgroundColor: "rgba(22,22,22,0.2)",
                borderColor: "rgba(22,22,22,1)",
                data: [65, 59, 80, 81]
            },
            {
                label: "Ingreso",
                backgroundColor: "rgba(54,162,235,0.8)",
                borderColor: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19]
            },
            {
                label: "No percibido",
                backgroundColor: "rgba(255,99,132,0.8)",
                borderColor: "rgba(151,187,205,1)",
                data: [38, 18, 4, 9]
            }
        ]
    }



    @montos_curso ={
        :base => @monto,
        :sep => (Valor.select("precio").where("grados_id = #{@curso.grado.id} and subvenciones_id = 2").first['precio']/@dias) * sep['asistencias'],
        :prioritarios => (Valor.select("precio").where("grados_id = #{@curso.grado.id} and subvenciones_id = 3").first['precio']/@dias) * prioritarios['asistencias'],
        :pie => (Valor.select("precio").where("grados_id = #{@curso.grado.id} and subvenciones_id = 4").first['precio']/@dias) * pie['asistencias'],


    }

    @costo= 0






    render 'estimadores/create'
  end
end
