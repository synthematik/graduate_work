# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]

  def index
    @employees = Employee.includes(:user, :department)

    # Фильтрация по кафедре
    if params[:department_id].present?
      @employees = @employees.where(department_id: params[:department_id])
      @selected_department = Department.find(params[:department_id])
    end

    # Поиск по имени
    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @employees = @employees.where(
        "first_name ILIKE ? OR last_name ILIKE ? OR middle_name ILIKE ?",
        search_term, search_term, search_term
      )
    end

    # Сортировка
    @employees = @employees.order(last_name: :asc, first_name: :asc)

    @pagy, @employees = pagy(@employees, items: 12)

    # Для фильтров
    @departments = Department.order(name: :asc)
    @total_employees = Employee.count
  end

  def show
    # Коллеги по кафедре (исключая текущего сотрудника)
    if @employee.department
      @colleagues = @employee.department.employees
        .where.not(id: @employee.id)
        .includes(:user)
        .order(last_name: :asc, first_name: :asc)
        .limit(6)
    end
  end

  private

  def set_employee
    @employee = Employee.includes(:user, :department).find(params[:id])
  end
end
