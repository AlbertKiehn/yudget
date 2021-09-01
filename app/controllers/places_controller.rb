class PlacesController < ApplicationController
  def index
    @places = Place.where(category: params[:format])
  end

  def show
    @user = current_user
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
    places.require(:place).permit(:name, :category, :description, :summary, :address, :photo, :user)
  end
end
