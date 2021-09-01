class PlacesController < ApplicationController
  def index
    @location = params[:spot]
    placesold = Place.where(category: params[:category])
    @places = placesold.near(@location, 3)
  end

  def show

    @user = current_user

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
      redirect_to places_path, notice: '***Thank you for uploading your yudget!***'
    else
      render :new
    end
    Cloudinary.config do |config|
      config.cloud_name = 'sample'
      config.api_key = '874837483274837'
      config.api_secret = 'a676b67565c6767a6767d6767f676fe1'
      config.secure = true
      config.cdn_subdomain = true
    end
  end

  Cloudinary.config do |config|
    config.cloud_name = 'sample'
    config.api_key = '874837483274837'
    config.api_secret = 'a676b67565c6767a6767d6767f676fe1'
    config.secure = true
    config.cdn_subdomain = true
  end

  # def upvote
  #   @place = Place.find(params[:id])
  #   if params[:format] == 'upvote'
  #     @place.upvotes_by(current_user)
  #   elsif params[:format] == 'unvote'
  #     @place.unvote_up(current_user)
  #   end
  # end
  def upvote
    @place = Place.find(params[:id])
    @place.liked_by current_user
    redirect_to place_path(@place)
  end

  def unvote
    @place = Place.find(params[:id])
    @place.downvote_from current_user
    redirect_to place_path(@place)
  end

  private

  def places_params
    params.require(:place).permit(:name, :category, :description, :summary, :address, :photo, :user).with_defaults(user_id: current_user.id)
  end
end
