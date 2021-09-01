class Place < ApplicationRecord
  belongs_to :user

  validates :name, :category, :description, :summary, :address, presence: true
  validates :address, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
