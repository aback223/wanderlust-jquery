class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :itinerary_id
      t.integer :user_id
    end
  end
end
