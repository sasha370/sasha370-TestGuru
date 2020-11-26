class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path, flash[:notice] = 'Вы успешно вошли!'
    else
      flash.now[:alert] = 'Вам необходимо войти или зарегистрироваться!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil if session[:user_id]
    redirect_to root_path, notice: 'Вы вышли из приложения!'
  end
end
