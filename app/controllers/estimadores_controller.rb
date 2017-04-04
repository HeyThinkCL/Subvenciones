class EstimadoresController < ApplicationController

  def index


  end
  def create


  end
  def sumar(horas)
    @costo = horas*(hora.profesor.remuneracion/ hora.profesor.horas+@costo)
  end

  def show

    inicio = "2017-04-01".to_date
    fin = inicio.end_of_month+1

    dia = inicio
    dias = 0
    while dia < fin  do
      if dia.wday != 0 and   dia.wday < 6
        dias = dias+1
      end
      dia = dia+1
    end
    @dias = dias




    @curso = Curso.find(params[:id])


    @perdida = (@curso.grado.valores.inject(0){|sum,x| sum + x.precio/@dias } )*@curso.inasistencias/100
    @monto = @curso.grado.valores.inject(0){|sum,x| sum + x.precio }*(@curso.cantidad_alumnos)/100 - @perdida
    @maximo = @curso.grado.valores.inject(0){|sum,x| sum + x.precio }*(@curso.cantidad_alumnos)/100



    id = params[:id]

    @sb2= sb = Alumno.where("cursos_id  = #{id} and subvenciones_id = 1 ").first

    @sb = {
        labels: [
            "Inasistencia",
            "Asistencia",

        ],
        datasets: [
            {
                data: [sb['inasistencias'],sb['asistencias']],
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
                label: "Subvencion Base",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderColor: "rgba(220,220,220,1)",
                data: [65, 59, 80, 81]
            },
            {
                label: "Sep",
                backgroundColor: "rgba(151,187,205,0.2)",
                borderColor: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19]
            },
            {
                label: "Pie",
                backgroundColor: "rgba(151,187,205,0.2)",
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
