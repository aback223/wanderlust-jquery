class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
