class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :password_digest
      t.string :email
      t.boolean :admin 
      t.boolean :chef
      t.string :phone
      t.text :image
      t.text :bio
      t.float :rate

      t.timestamps null: false
    end
  end
end
