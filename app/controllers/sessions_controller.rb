class SessionsController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]
  before_action :require_authentication, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      sign_in(user)
      remember_user(user) if params[:remember_me] == "1" # TODO передавать из view
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
