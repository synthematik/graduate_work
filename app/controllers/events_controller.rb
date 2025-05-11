class EventsController < ApplicationController
  before_action :require_authentication, only: [:create, :update, :destroy, :edit, :new]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @events = Event.published.order(starts_at: :asc).limit(5)
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :starts_at, :ends_at, :published, :location)
  end
end
