class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @location = request.location.coordinates
  end

  def categories
    @spot = params[:format]
    @categories = ['food', 'nightlife', 'activities', 'shopping', 'services']
  end
end
