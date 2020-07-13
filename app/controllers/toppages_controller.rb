class ToppagesController < ApplicationController

  def index
    @map = Map.all
    # Using gmap4rails
    @hash = Gmaps4rails.build_markers(@map) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow render_to_string(partial: 'maps/infowindow', locals: {map: map})
    end
  end

  def about
  end

  def news
  end

  def terms_of_service_
  end

  def privacy_policy
  end

end

