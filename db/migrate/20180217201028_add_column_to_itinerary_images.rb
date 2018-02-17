class AddColumnToItineraryImages < ActiveRecord::Migration[5.0]
  def change
    add_column :itinerary_images, :image_id, :integer
  end
end
