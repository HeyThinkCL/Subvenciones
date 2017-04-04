class LoginController < ActionController::Base

  def create

    if params[:email].to_s == "f.plaza@heythink.cl"

      session[:id] = 1
      redirect_to  action: 'index',controller:'dashboard', status: 302
    else
      redirect_to  action: index

    end


  end
  def index


  end
end
