class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show]

  def index
    @pagy, @departments = pagy(Department.ordered.includes(:employees), items: 12)

    # Статистика для заголовка
    @total_departments = Department.count
    @total_employees = Employee.count
  end

  def show
    @employees = @department.employees.includes(:user).order(last_name: :asc, first_name: :asc)
    @pagy, @employees = pagy(@employees, items: 12)
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end
end
