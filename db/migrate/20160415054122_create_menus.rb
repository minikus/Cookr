class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.string :cuisine
      t.text :description
      t.float :pricePP
      t.text :dietry
      t.boolean :gluten_free
      t.boolean :vego
      t.string :title
      t.text :image

      t.timestamps null: false
    end
  end
end
