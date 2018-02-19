class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.string :title
      t.integer :itinerary_id
    end
  end
end
