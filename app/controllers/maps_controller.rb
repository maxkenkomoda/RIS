class MapsController < ApplicationController
  before_action :correct_user, only: [:destroy, :update]
  before_action :user_signed_in?, only: [:new, :create, :destroy]  
  before_action :get_map, only: [:show, :edit, :update, :destroy]


  def index
    @map_index = Map.all
    # Using gmap4rails
    @hash = Gmaps4rails.build_markers(@map_index) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow render_to_string(partial: 'maps/infowindow', locals: {map: map})
    end
  end


  def show
    get_map
    # Using gmap4rails
    @hash_show = Gmaps4rails.build_markers(@map) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
    end
  end


  def new
    @new_map = Map.new
    @new_map.build_title
    @new_map.build_traffic
    @new_map.build_road
    @new_map.build_shop
    @new_map.build_comment
  end


  def create
    @new_map = current_user.maps.build(map_params)
    if @new_map.save
      flash[:sucess] = '投稿を保存しました'
      redirect_to controller: 'maps', action: 'index'
    else
      flash.now[:danger] = '投稿を保存できませんでした'
      render action: :new
    end
  end


  def edit
    get_map
  end


  def update
    get_map

    if @map.update(map_params)
      flash[:sucess] = '編集に成功しました'
    redirect_to controller: 'users', action: 'show', id: current_user.id
    end



  end


  def destroy
    @user_map.destroy
    redirect_to controller: 'maps', action: 'index'
  end


private


  def get_map
    @map = Map.find(params[:id])
  end


  def map_params
    params.require(:map).permit(
      :latitude, :longitude, 
      title_attributes: [:title], 
      traffic_attributes: [:volume, :speed, :large_car, :people, :stop],
      road_attributes: [:condition, :sidewalk, :narrow],
      shop_attributes: [:no_shop, :no_vending_machine],
      comment_attributes: [:comment]
    )

  end


  def correct_user
    @user_map = current_user.maps.find_by(id: params[:id])
    unless @user_map
      redirect_to root_url
    end
  end
end
