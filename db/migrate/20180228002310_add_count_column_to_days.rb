class AddCountColumnToDays < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :count, :integer
  end
end
