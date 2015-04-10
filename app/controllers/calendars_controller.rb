class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_official!, only: [:new, :edit, :create, :update, :destroy]

  respond_to :html

  def index
    @calendars = Calendar.all.order(like_count: :desc).take(10)
    respond_with(@calendars)
  end

  def show
    respond_with(@calendar)
  end

  def new
    @calendar = Calendar.new
    respond_with(@calendar)
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.save
    respond_with(@calendar)
  end

  def update
    @calendar.update(calendar_params)
    respond_with(@calendar)
  end

  def destroy
    @calendar.destroy
    respond_with(@calendar)
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def calendar_params
      params[:calendar]
    end
end
