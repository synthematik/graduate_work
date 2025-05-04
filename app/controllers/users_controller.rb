class UsersController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]
  before_action :require_authentication, only: [:edit, :update]
  before_action :set_user!, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_users_path(current_user)
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user!
    @user = ::User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :old_password)
  end
end
