class PlacesController < ApplicationController
  def index
    @category = params[:category]
    @location = params[:spot]
    placesold = Place.where(category: params[:category])
    @places = placesold.near(@location, 8)
    Cloudinary.config do |config|
      config.cloud_name = 'mk01'
      config.api_key = '243339615997478'
      config.api_secret = 'YEyzNmKecdmScbJTs5wcY3KFlO8'
      config.secure = true
      config.cdn_subdomain = true
    end
  end

  def show
    @user = current_user
    @location = params[:spot]
    @place = Place.find(params[:id])
    Cloudinary.config do |config|
      config.cloud_name = 'mk01'
      config.api_key = '243339615997478'
      config.api_secret = 'YEyzNmKecdmScbJTs5wcY3KFlO8'
      config.secure = true
      config.cdn_subdomain = true
    end
  end

  def new
    @place = Place.new
    Cloudinary.config do |config|
      config.cloud_name = 'mk01'
      config.api_key = '243339615997478'
      config.api_secret = 'YEyzNmKecdmScbJTs5wcY3KFlO8'
      config.secure = true
      config.cdn_subdomain = true
    end
  end

  def create
    @place = Place.new(places_params)
    @place.user = current_user
    if @place.save
      redirect_to "/", notice: '***Thank you for uploading your yudget!***'
    else
      render :new
    end
    Cloudinary.config do |config|
      config.cloud_name = 'mk01'
      config.api_key = '243339615997478'
      config.api_secret = 'YEyzNmKecdmScbJTs5wcY3KFlO8'
      config.secure = true
      config.cdn_subdomain = true
    end
  end

  def upvote
    @location = params[:spot]
    @place = Place.find(params[:id])
    @place.liked_by current_user
    redirect_to place_path(@place, :spot => @location)
  end

  def unvote
    @location = params[:spot]
    @place = Place.find(params[:id])
    @place.downvote_from current_user
    redirect_to place_path(@place, :spot => @location)
  end

  def upvotes
    @category = params[:category]
    @location = params[:spot]
    @place = Place.find(params[:id])
    @place.liked_by current_user
    placesold = Place.where(category: params[:category])
    @places = placesold.near(@location, 3)
    redirect_to places_path(@place, :category => @category, :spot => @location)
  end

  def unvotes
    @category = params[:category]
    @location = params[:spot]
    @place = Place.find(params[:id])
    @place.downvote_from current_user
    placesold = Place.where(category: params[:category])
    @places = placesold.near(@location, 3)
    redirect_to places_path(@place, :category => @category, :spot => @location)
  end

  private

  def places_params
    params.require(:place).permit(:name, :category, :description, :summary, :address, :photo, :user).with_defaults(user_id: current_user.id)
  end
end
