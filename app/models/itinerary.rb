class Itinerary < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
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

  def datestart_cant_be_in_past
    if datestart && datestart < Date.today
      errors.add(:datestart, "can't be in the past")
    end
  end

  def dateend_comes_after_datestart
    if dateend && dateend < datestart
      errors.add(:dateend, "can't be before start date")
    end
  end
end
