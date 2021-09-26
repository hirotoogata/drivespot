class DrivingsController < ApplicationController
  before_action :authenticate_user!

  #arr = [a,b,c]
  #hash = {タグ１: 1, タグ２: 0, たぐ３: 1}

  def index
    @drivings = Driving.all
    @drivings = @drivings.where("destination LIKE ? ",'%' + params[:destination_search] + '%') if params[:destination_search]
    @drivings = @drivings.where("address LIKE ? ",'%' + params[:address_search] + '%') if params[:address_search]
    
    if params[:genre_ids]
      genre_driving_ids = [] #idは配列
      params[:genre_ids].each do |key, value|   #ハッシュを持ってくるため変数2つ   
        if value == "1" #チェック済
          Genre.find_by(name: key).drivings.each do |driving|
            genre_driving_ids << driving.id
          end
          @drivings = @drivings.where(id: genre_driving_ids)
        end
      end
    end

    if params[:genre]
      Genre.create(name: params[:genre])
    end

    @rank_drivings = @drivings.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
  
    @genres = Genre.all
  
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
