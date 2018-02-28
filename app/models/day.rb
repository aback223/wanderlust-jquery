class Day < ApplicationRecord
  belongs_to :itinerary
  has_many :activities

  validates :date, presence: true
end