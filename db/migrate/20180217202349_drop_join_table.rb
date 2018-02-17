class DropJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :itinerary_images
  end
end
