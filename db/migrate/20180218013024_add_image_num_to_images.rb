class AddImageNumToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :image_num, :string
  end
end
