class CursosController < ApplicationController
  def index
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



  end
end
