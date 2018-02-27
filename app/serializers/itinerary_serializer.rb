class ItinerarySerializer < ActiveModel::Serializer
  attributes :datestart, :dateend, :trip_title, :id
  has_many :users
end
