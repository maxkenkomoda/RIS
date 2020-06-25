class UsersController < ApplicationController
  before_action :user_signed_in?
  before_action :get_other_user_map, only: [:like, :unlike, :bookmark, :unbookmark]
  before_action :get_current_user_id, only: [:show, :likes, :bookmarks] 
  after_action :gmaps4rails, only: [:show, :likes, :bookmarks]

  def show
    get_current_user_id 
    @user_map = current_user.maps.all
    gmaps4rails
  end

  def like 
    get_other_user_map
    @favorite = current_user.favorites.build(user_id: current_user.id, map_id: @other_map.id)

    if @favorite.save 
      flash[:success] = '評価ありがとうございます。'
      redirect_to controller: :maps, action: :show, id: @other_map
    else 
      flash[:now] = 'エラーが発生しました。'
    end
  end
  
  def unlike
    get_other_user_map
    @favorite = Favorite.find_by(map_id: params[:id])
    if @favorite.destroy
      flash[:success] = '評価ありがとうございます。'
      redirect_to controller: :maps, action: :show, id: @other_map
    else 
      flash[:now] = 'エラーが発生しました。'
    end
  end

  #get current_user liked list
  def likes
    get_current_user_id 
    @user_map = @user.likes
    gmaps4rails 
  end

  def bookmark
    get_other_user_map
    @bookmark = current_user.bookmarks.build(user_id: current_user.id, map_id: @other_map.id)

    if @bookmark.save
    flash[:success] = 'ブックマークに登録しました'
      redirect_to controller: :maps, action: :show, id: @other_map
    else 
      flash[:now] = 'エラーが発生しました。'
    end
  end

  def unbookmark
    get_other_user_map
    @bookmark = Bookmark.find_by(map_id: params[:id])

    if @bookmark.destroy
      flash[:success] = 'ブックマークから削除しました。'
      redirect_to controller: :maps, action: :show, id: @other_map
    else 
      flash[:now] = 'エラーが発生しました。'
    end
  end
  
  #get current_user bookmark list
  def bookmarks
    get_current_user_id 
    @user_map = @user.reverse_of_bookmarks
    gmaps4rails
  end

  
  private

  def get_other_user_map
   @other_map = Map.find(params[:id])
  end
  
  def get_current_user_id
    @user = User.find(current_user.id)
  end

  def gmaps4rails
    @hash = Gmaps4rails.build_markers(@user_map) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow render_to_string(partial: 'maps/infowindow', locals: {map: map})
    end
  end 
end
