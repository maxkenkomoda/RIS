class PostsController < ApplicationController
  
  def index
    @map_index = Map.all
    @hash = Gmaps4rails.build_markers(@map_index) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
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
    @post = Post.new
  end


  def create
    @map_create = current_user.maps.build(map_params)
    if @map_create.save
      redirect_to action: 'index'
    else
      render action: :new
    end
  end

  def get_map
    @map_show = Map.find(params[:id])
  end


  private

  def map_params
    params.require(:map).permit(:latitude, :longitude) 
  end
end

