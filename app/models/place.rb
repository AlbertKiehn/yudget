class Place < ApplicationRecord
  belongs_to :user

  validates :name, :category, :description, :summary, :address, presence: true
  validates :address, uniqueness: true
end
