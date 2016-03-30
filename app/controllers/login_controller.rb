class LoginController < ApplicationController

  def index
  end

  def do_login

    params.require(:password)

    if params[:password] == 'dummy'
      log_in
      redirect_to '/rsvps'
    else
      flash[:danger] = 'Wrong password - try again!'
      render 'index'
    end
  end

  def logout
    clear_login
    redirect_to '/'
  end

end
