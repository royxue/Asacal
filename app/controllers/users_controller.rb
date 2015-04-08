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
      #
      # def user_params
      #   params[:user]
      # end
end
