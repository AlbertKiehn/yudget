class PlacesController < ApplicationController

  def index
    @places = Place.where(category: params[:format])
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(places_params)
    @place.user = current_user
    if @place.save
      redirect_to places_path, notice: '***Thank you for uploading your yudget!***'
    else
      render :new
    end
  end

  private

  def places_params
    params.require(:place).permit(:name, :category, :description, :summary, :address, :photo, :user).with_defaults(user_id: current_user.id)
  end
end
