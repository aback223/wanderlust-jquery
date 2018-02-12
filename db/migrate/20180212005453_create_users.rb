class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :firstname
      t.string :lastname
    end
  end
end