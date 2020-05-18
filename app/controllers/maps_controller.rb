class MapsController < ApplicationController
  
  def index
    @maps = Map.all
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow map.title
    end
  end

  def new
    @map = Map.new
  end


  def create
    @map = current_user.maps.build(map_params)
    if @map.save
      redirect_to action: 'index'
    else
      render action: :new
    end
  end



  private

  def map_params
    params.permit(:latitude, :longitude, :title)  
  end

end
