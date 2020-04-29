class MapsController < ApplicationController
  
  def index

  end

  def new
    @map = Map.new
  end


  def create
    @map = Map.new(map_params)
    @map.save
  end



  private

  def map_params
    params.permit(:latitude, :longitude, :content)  
  end
end
