class Place < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :category, :description, :summary, :address, presence: true
  validates :description, length: { minimum: 200, maximum: 405 }
  validates :summary, length: { minimum: 10, maximum: 200 }
  validates :address, uniqueness: true
  validates :description, length: { minimum: 200 }
  validates :description, length: { maximum: 405 }
  validates :summary, length: { minimum: 10 }
  validates :summary, length: { maximum: 100 }
  validates :photo, presence: true

  acts_as_votable

  CATEGORIES = ['food', 'nightlife', 'activities', 'shopping', 'services']

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
