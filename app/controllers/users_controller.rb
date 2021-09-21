class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @likespots = current_user.liked_drivings.all
  end
end
