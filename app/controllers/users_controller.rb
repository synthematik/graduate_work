class UsersController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]
  before_action :require_authentication, only: [:show, :edit, :update]
  before_action :set_user!, only: [:show, :edit, :update]
  layout "clean", only: [:new, :create]

  def edit
  end

  def show
    @articles = @user.articles.order(created_at: :desc).limit(3)
    @schedules = @user.schedules.order(created_at: :desc).limit(3)
    @events = @user.events.published.order(starts_at: :asc).limit(3)
    @recent_notifications = @user.notifications.order(created_at: :desc).limit(3)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
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
    @user = User.find(params[:id])

    unless @user == current_user || current_user&.admin_role?
      redirect_to root_path, alert: "Недостаточно прав для просмотра этого профиля"
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :old_password)
  end
end
