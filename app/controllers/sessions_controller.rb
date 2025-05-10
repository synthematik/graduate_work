class SessionsController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]
  before_action :require_authentication, only: [:destroy]
  layout "clean"

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      sign_in(user)
      remember_user(user) if session_params[:remember_me] == "1"
      redirect_to root_path
    else
      flash.now[:error] = "Неверный email или пароль"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
