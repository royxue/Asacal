class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # def index
    #   @users = user.all
    #   respond_with(@users)
    # end

    def show
      calendars = @user.calendars
      @events = Event.where(calendar: calendars)
      respond_to do |format|
        format.html
        format.json { render json:@events.to_json }
      end
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
    end
    #
    # def new
    #   @user = user.new
    #   respond_with(@user)
    # end
    #
    # def edit
    # end
    #
    # def create
    #   @user = user.new(user_params)
    #   @user.save
    #   respond_with(@user)
    # end
    #
    # def update
    #   @user.update(user_params)
    #   respond_with(@user)
    # end
    #
    # def destroy
    #   @user.destroy
    #   respond_with(@user)
    # end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params[:user]
      end

      def follow_params
        params[:user, :calendar, :event]
      end
end
