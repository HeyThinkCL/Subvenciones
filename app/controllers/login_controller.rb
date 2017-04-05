class LoginController < ActionController::Base

  def create


    usuario = Usuario.where(:email=> params[:email]).first
    if usuario != nil and params[:password].to_s == usuario.passwd

      session[:id] = usuario.id
      redirect_to  action: 'index',controller:'dashboard', status: 302
    else
      redirect_to  action: index

    end


  end
  def index


  end
end
