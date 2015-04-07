class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to user_path(current_user)
    elsif current_official
      redirect_to official_path(current_official)
    end
  end
end
