class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  
    @user_map = current_user.maps.all
    # Using gmap4rails
    @hash = Gmaps4rails.build_markers(@user_map) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow render_to_string(partial: 'maps/infowindow', locals: {map: map})
    end
  end
end
