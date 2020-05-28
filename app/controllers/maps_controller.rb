class MapsController < ApplicationController

  def index
    @map_index = Map.all
    @hash = Gmaps4rails.build_markers(@map_index) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow map.title.title
    end
  end

  def show
    @map_show = Map.find(params[:id])
    @hash_show = Gmaps4rails.build_markers(@map_show) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
    end

  end


  def new
    @map = Map.new
    @map.build_title
  end


  def create
    @map = current_user.maps.build(map_params)
    if @map.save
     
      redirect_to controller: 'maps', action: 'index'
    else
      render action: :new
    end
  end

  def get_map
    @map_show = Map.find(params[:id])
  end

  def destroy


  end
  private


  def map_params
    params.require(:map).permit(:latitude, :longitude, title_attributes: [:title]) 
  end
end
