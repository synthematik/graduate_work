class Admin::EmployeesController < Admin::BaseController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :create, :edit, :update]
  before_action :set_users_without_employee, only: [:new, :create, :edit]

  def index
    @employees = Employee.includes(:user, :department)

    # Фильтрация по кафедре
    @employees = @employees.where(department_id: params[:department_id]) if params[:department_id].present?

    # Сортировка
    @employees = @employees.order(last_name: :asc, first_name: :asc)

    @pagy, @employees = pagy(@employees, items: 10)

    # Для фильтров в представлении
    @departments = Department.order(name: :asc)
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      flash[:notice] = "Сотрудник успешно добавлен."
      redirect_to admin_employees_path
    else
      # Если произошла ошибка, заново загружаем список пользователей
      set_users_without_employee
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Информация о сотруднике успешно обновлена."
      redirect_to admin_employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    flash[:notice] = "Сотрудник успешно удален из системы."
    redirect_to admin_employees_path
  end

  private

  def set_employee
    @employee = Employee.includes(:user, :department).find(params[:id])
  end

  def set_departments
    @departments = Department.order(name: :asc)
  end

  def set_users_without_employee
    # Все пользователи без сотрудника + текущий пользователь сотрудника (если есть)
    @available_users = User.left_outer_joins(:employee)
      .where("employees.id IS NULL OR employees.id = ?", @employee&.id)
      .order(:email)
  end

  def employee_params
    params.require(:employee).permit(
      :user_id,
      :department_id,
      :first_name,
      :last_name,
      :middle_name,
      :degree,
      :rank,
      :description,
      :position,
      links: {}
    )
  end
end
