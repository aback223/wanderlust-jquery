class CreateImagesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :images_tables do |t|
      t.string :url
      t.string :caption
      t.timestamps
    end
  end
end
