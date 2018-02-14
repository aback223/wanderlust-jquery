class Itinerary < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  validates :trip_title, presence: true
end
