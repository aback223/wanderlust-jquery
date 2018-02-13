class AddTitleToItineraries < ActiveRecord::Migration[5.0]
  def change
    add_column :itineraries, :trip_title, :string
  end
end
