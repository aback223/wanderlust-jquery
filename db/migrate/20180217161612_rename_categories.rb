class RenameCategories < ActiveRecord::Migration[5.0]
  def change
    rename_table :categories, :tags
  end
end
