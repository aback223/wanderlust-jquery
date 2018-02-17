class CreateItineraryTags < ActiveRecord::Migration[5.0]
  def change
    create_table :itinerary_tags do |t|
      t.integer :itinerary_id
      t.integer :tag_id
    end
  end
end
