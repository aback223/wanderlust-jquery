class Image < ApplicationRecord
  belongs_to :itinerary
  validates :url, allow_blank: true, format: {
    with: %r{\.gif|jpg|png|jpeg}, 
    message: "must be a url for gif, jpg, or png image."
  }
end