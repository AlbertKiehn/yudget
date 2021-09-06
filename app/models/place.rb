class Place < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :category, :description, :summary, :address, presence: true
  validates :address, uniqueness: true

  acts_as_votable

  CATEGORIES = ['food', 'nightlife', 'activities', 'shopping', 'services']

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
