class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname
  has_many :itineraries
end
