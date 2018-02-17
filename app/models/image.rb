class Image < ApplicationRecord
  has_many :itinerary_images
  has_many :itineraries, through: :itinerary_images
end