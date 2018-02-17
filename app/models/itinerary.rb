class Itinerary < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :invites
  validates :trip_title, presence: true
  has_many :itinerary_tags
  has_many :tags, through: :itinerary_tags
end
