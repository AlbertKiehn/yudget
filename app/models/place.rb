class Place < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :category, :description, :summary, :address, presence: true
  validates :address, uniqueness: true

  CATEGORIES = ['food', 'nightlife', 'activities', 'shopping', 'services']
end
