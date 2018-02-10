class CreateItineraries < ActiveRecord::Migration[5.0]
  def change
    create_table :itineraries do |t|
      t.date :datestart
      t.date :dateend

      t.timestamps
    end
  end
end
