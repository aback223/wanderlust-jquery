class Itinerary < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :invites
  has_many :images
  has_many :days
  validates :trip_title, presence: true
  validates :datestart, presence: true
  validates :dateend, presence: true
  validate :datestart_cant_be_in_past
  validate :dateend_comes_after_datestart
  
  def self.most_recent_by_user(user)
    itineraries = []
    Itinerary.all.order(:datestart).each do |i|
      if i.users.include?(user)
        itineraries << i
      end
    end
    itineraries
  end
end
