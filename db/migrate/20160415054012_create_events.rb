class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time
      t.string :suburb
      t.string :address
      t.integer :user_id
      t.integer :chef_id
      t.integer :menu_id
      t.text :description
      t.integer :guests
      t.boolean :confirm
      t.float :price

      t.timestamps null: false
    end
  end
end
