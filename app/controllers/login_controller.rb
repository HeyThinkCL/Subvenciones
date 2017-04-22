class LoginController < ActionController::Base

  def create


    require_relative '../../code/connect.rb'

    data = connect_innova(params[:email],params[:password].to_s)

    p data

    session[:usuario] = {:email=>data[:usuario]['email'],:nombre=>data[:usuario]['usuario']['nombre'],:apellido=>data[:usuario]['usuario']['apellido_paterno']}
    session[:colegio] = data[:colegios].first[:nombre]
    session[:dias_habiles] = data[:colegios].first[:dias_habiles]

    data[:colegios].first[:cursos].each do |curso|

      grado =  curso[:grado].split("° ")
      if grado.length == 2
        g = grado[1].gsub "básico","basico"
        g = g.gsub "medio","media"

        xgrado =Grado.where(:nivel=>grado[0].to_i,:estado=>g).first

        xcurso = Curso.where(:grados_id=>xgrado.id,:letra=>curso[:curso]).first
        xcurso.cantidad_alumnos = curso[:cantidad]
        xcurso.inasistencias = curso[:inasistencias]
        xcurso.save

      else
        if grado[0] =="Kinder"
          g = "kinder"
          xgrado =Grado.where(:nivel=>2,:estado=>g).first
        elsif grado[0] =="Pre Kinder"
          g = "kinder"
          xgrado =Grado.where(:nivel=>1,:estado=>g).first

        end

        xcurso = Curso.where(:grados_id=>xgrado.id,:letra=>curso[:curso]).first
        xcurso.cantidad_alumnos = curso[:cantidad]
        xcurso.inasistencias = curso[:inasistencias]
        xcurso.save

      end

    end

    redirect_to  action: 'index',controller:'dashboard', status: 302

  end
  def index


  end
  def logout

    session.clear
    redirect_to  action: 'index'

  end
end
