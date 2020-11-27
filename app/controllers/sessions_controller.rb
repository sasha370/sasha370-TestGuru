class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to  cookies[:from_url] || tests_path, notice: 'Вы успешно вошли!'
    else
      flash.now[:alert] = 'Введите данные или зарегистрируйтесь!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Вы вышли из приложения!'
  end
end
