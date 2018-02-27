class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :activity_type, :address, :url, :notes
end
