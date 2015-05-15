class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
      @officials = @user.officials
      @calendars = @user.calendars
      @events = Event.where(calendar: @calendars)
      respond_to do |format|
        format.html
        format.json { render json:@events.to_json }
      end
    end

    def follow_official
      @user = User.find(params[:user])
      official = Official.find(params[:official])
      if @user.officials.include?  official
        @user.officials.delete(official)
      else
        @user.officials<<(official)
      end

      redirect_to user_path(@user)
    end

    def follow_calendar
      @user = User.find(params[:user])
      calendar = Calendar.find(params[:calendar])
      if @user.calendars.include?  calendar
        @user.calendars.delete(calendar)
      else
        @user.calendars<<(calendar)
      end

      redirect_to user_path(@user)
    end

    def follow_event
      @user = User.find(params[:user])
      event = Event.find(params[:event])
      if @user.events.include?  event
        @user.events.delete(event)
      else
        @user.events<<(event)
      end

      redirect_to user_path(@user)
    end

    def new
      @user = user.new
      respond_with(@user)
    end

    def edit
    end

    def create
      @user = user.new(user_params)
      @user.save
      respond_with(@user)
    end

    def update
      @user.update(user_params)
      respond_with(@user)
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params[:user]
      end

      def follow_params
        params[:user, :official, :calendar, :event]
      end
end
