class Itinerary < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :invites
  validates :trip_title, presence: true
  has_many :images

  def image_attributes=(image_attributes)
    image_attributes.values.each do |image_attribute|
      self.images.build(image_attribute)
    end
  end
end
