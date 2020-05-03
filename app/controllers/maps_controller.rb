class MapsController < ApplicationController
  
  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end


  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to action: 'index'
    else
      render action: :new
    end
  end



  private

  def map_params
    params.permit(:latitude, :longitude, :content)  
  end
end
