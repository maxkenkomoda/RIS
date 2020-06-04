class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:like, :unlike]  
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

  def like 
    @other_map = Map.find(params[:id])
    @favorite = current_user.favorites.build(user_id: current_user.id, map_id: @other_map.id)

    if @favorite.save 
      flash[:success] = '評価ありがとうございます。'
      redirect_to controller: :maps, action: :show, id: @other_map
    else 
      flash[:now] = 'エラーが発生しました。'
    end
  end
  
  def unlike
    @other_map = Map.find(params[:id])
    @favorite = Favorite.find_by(map_id: params[:id])
    if @favorite.destroy
      flash[:success] = '評価ありがとうございます。'
      redirect_to controller: :maps, action: :show, id: @other_map
    else 
      flash[:now] = 'エラーが発生しました。'
    end
  end
end
