class DrivingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @drivings = Driving.all
    @rank_drivings = Driving.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
  end

  def new
    @driving = Driving.new
    @drivings = Driving.where(user_id: current_user.id).all
  end

  def create
    driving = Driving.new(driving_params)
    driving.user_id = current_user.id

    if driving.save
      redirect_to :action => "new"
    else
      redirect_to :action => "new"
    end
  end

  def edit
    @driving = Driving.find(params[:id])
  end

  def update
    driving = Driving.find(params[:id])
    if driving.update(driving_params)
      redirect_to :action => "new"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    driving = Driving.find(params[:id])
    driving.destroy
    redirect_to action: :new
  end

  def show
    @driving = Driving.find(params[:id])
    @comments = @driving.comments
    @comment = Comment.new
  end

  private
  def driving_params
    params.require(:driving).permit(:destination, :image, :body, :address, genre_ids:[])
  end

end
