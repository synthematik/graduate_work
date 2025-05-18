class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @users = pagy(User.all.order(created_at: :desc), items: 10)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Пользователь успешно создан."
      redirect_to admin_users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Пользователь успешно обновлен."
      redirect_to admin_users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = "Вы не можете удалить свой аккаунт."
      return redirect_to admin_users_path
    end

    @user.destroy
    flash[:notice] = "Пользователь успешно удален."
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :login, :password, :password_confirmation, :role)
  end
end
