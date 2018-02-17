class AddColumnToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :itinerary_id, :integer
  end
end
