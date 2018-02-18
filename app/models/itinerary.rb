class Itinerary < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :invites
  validates :trip_title, presence: true
  has_many :images

  def images_attributes=(images_attributes)
    images_attributes.values.each do |image_attributes|
      self.images.build(image_attributes)
    end
  end
end
