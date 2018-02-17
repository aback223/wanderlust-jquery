class CreateItineraryImages < ActiveRecord::Migration[5.0]
  def change
    create_table :itinerary_images do |t|
      t.string :img_url
      t.string :caption
      t.integer :itinerary_id
    end
  end
end
