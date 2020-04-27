class MapsController < ApplicationController
  
  def index

  end

  def new
  end


  def create
    @content = Map.new(params[:content])
    @latitude = Map.new(params[:latitude])
    @longitude = Map.new(params[:longitude])
   #binding.pry

   @content.save
   @latitude.save
   @longitude.save
  end


  #private

  #def map_param
   # params.require(:map).permit(:latitude, :longitude, :content)
  #end
end
