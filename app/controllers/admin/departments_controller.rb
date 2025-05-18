class Admin::DepartmentsController < Admin::BaseController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @departments = pagy(Department.ordered, items: 20)
  end

  def show
    @employees = @department.employees.includes(:user).order(last_name: :asc)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      flash[:notice] = "Кафедра успешно создана."
      redirect_to admin_departments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      flash[:notice] = "Кафедра успешно обновлена."
      redirect_to admin_departments_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @department.employees.any?
      flash[:alert] = "Невозможно удалить кафедру, так как к ней привязаны сотрудники."
    else
      @department.destroy
      flash[:notice] = "Кафедра успешно удалена."
    end
    redirect_to admin_departments_path
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :description)
  end
end
