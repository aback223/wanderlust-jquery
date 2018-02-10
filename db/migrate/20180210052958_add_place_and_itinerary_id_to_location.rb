class AddPlaceAndItineraryIdToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :place_id, :integer
    add_column :locations, :itinerary_id, :integer
  end
end
