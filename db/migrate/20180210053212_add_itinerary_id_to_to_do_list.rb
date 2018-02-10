class AddItineraryIdToToDoList < ActiveRecord::Migration[5.0]
  def change
    add_column :to_do_lists, :itinerary_id, :integer
  end
end
