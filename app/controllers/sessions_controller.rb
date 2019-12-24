class SessionsController < ApplicationController
  before_action :new_order, :new_call_order, only: [:new]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Добро пожаловать!'
      redirect_to root_path
    else
      flash[:success] = 'Не верное имя или пароль!'
      render 'new'
    end
  end

  def destroy
    reset_session rescue nil
    flash[:success] = 'Еще увидимся!'
    redirect_to root_path
  end
end
