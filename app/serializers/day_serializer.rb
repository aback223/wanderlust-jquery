class DaySerializer < ActiveModel::Serializer
  attributes :id, :title, :itinerary_id, :date
  has_many :activities
end
