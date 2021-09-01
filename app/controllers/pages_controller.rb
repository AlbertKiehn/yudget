class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    ip = request.remote_ip
    @location = Geocoder.search(ip)
  end

  def categories
    @spot = params[:format]
    @categories = ['food', 'nightlife', 'activities', 'shopping', 'services']
  end
end
