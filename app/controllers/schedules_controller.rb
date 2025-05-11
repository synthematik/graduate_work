class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    schedules = Schedule.all

    schedules = schedules.where(course_number: params[:course_number]) if params[:course_number].present?
    schedules = schedules.where(education_form: params[:education_form]) if params[:education_form].present?
    schedules = schedules.where(semester_type: params[:semester_type]) if params[:semester_type].present?
    schedules = schedules.where(schedule_type: params[:schedule_type]) if params[:schedule_type].present?

    if params[:academic_year].present?
      start_year, end_year = params[:academic_year].split("-")
      schedules = schedules.where(start_year: start_year, end_year: end_year) if start_year.present? && end_year.present?
    end

    schedules = schedules.order(start_year: :desc, end_year: :desc, created_at: :desc)

    @pagy, @schedules = pagy(schedules, items: 10)

    respond_to do |format|
      format.html
      format.turbo_stream if turbo_frame_request?
    end
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
      redirect_to schedules_path, notice: "Расписание успешно создано."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice: "Расписание успешно обновлено."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path, notice: "Расписание успешно удалено."
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :course_number, :education_form,
      :semester_type, :schedule_type, :start_year,
      :end_year, :file_url)
  end
end
