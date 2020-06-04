class MapsController < ApplicationController
  before_action :correct_user, only: [:destroy, :update]
  before_action :user_signed_in?, only: [:new, :create, :destroy]  
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
    @map_show = Map.find(params[:id])
    # Using gmap4rails
    @hash_show = Gmaps4rails.build_markers(@map_show) do |map, marker|
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
      flash[:sucess] = 'Saved Your information'
      redirect_to controller: 'maps', action: 'index'
    else
      flash.now[:danger] = 'Sorry, we could not save your inforamtion'
      render action: :new
    end
  end


  def destroy
    @user_map.destroy
    redirect_to controller: 'maps', action: 'index'
  end


private


  def get_map
    @map_show = Map.find(params[:id])
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
