class PlacesController < ApplicationController

  def index
    @location = params[:spot]
    @places = Place.where(category: params[:category])
  end

  def show
    @location = params[:spot]
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(places_params)
    @place.user = current_user
    if @place.save
      redirect_to '/places', notice: '***Thank you for uploading your yudget!***'
    else
      render :new
    end
  end

  private

  def places_params
    places.require(:place).permit(:name, :category, :description, :summary, :address, :photo, :user)
  end
end
