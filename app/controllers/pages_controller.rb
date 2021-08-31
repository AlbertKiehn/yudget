class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def categories
    @categories = ['food', 'nightlife', 'activities', 'shopping', 'services']
  end
end
