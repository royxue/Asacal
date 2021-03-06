class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_official!, only: [:new, :edit, :create, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all.order(like_count: :desc)
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:calendar_id, :name, :description, :place, :link, :note, :is_all_day, :start_time, :end_time, :img, :is_public)
    end
end
