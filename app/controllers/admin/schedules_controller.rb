class Admin::SchedulesController < Admin::BaseController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.includes(:user).order(start_year: :desc, end_year: :desc)

    # Фильтрация по учебному году
    @schedules = @schedules.where(start_year: params[:start_year]) if params[:start_year].present?
    @schedules = @schedules.where(end_year: params[:end_year]) if params[:end_year].present?

    # Фильтрация по типу
    @schedules = @schedules.where(education_form: params[:education_form]) if params[:education_form].present?
    @schedules = @schedules.where(semester_type: params[:semester_type]) if params[:semester_type].present?
    @schedules = @schedules.where(schedule_type: params[:schedule_type]) if params[:schedule_type].present?

    @pagy, @schedules = pagy(@schedules, items: 10)

    # Для фильтров в представлении
    @years_range = Schedule.distinct.pluck(:start_year, :end_year).flatten.uniq.sort.reverse
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user

    if @schedule.save
      flash[:notice] = "Расписание успешно создано."
      redirect_to admin_schedules_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      flash[:notice] = "Расписание успешно обновлено."
      redirect_to admin_schedules_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    flash[:notice] = "Расписание успешно удалено."
    redirect_to admin_schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :course_number,
      :education_form,
      :semester_type,
      :schedule_type,
      :start_year,
      :end_year,
      :file_url
    )
  end
end
