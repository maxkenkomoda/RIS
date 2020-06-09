class ToppagesController < ApplicationController
  def index
    @map_index = Map.all
    # Using gmap4rails
    @hash = Gmaps4rails.build_markers(@map_index) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow render_to_string(partial: 'maps/infowindow', locals: {map: map})
    end
  end
end
