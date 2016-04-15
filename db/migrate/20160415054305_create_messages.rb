class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :target
      t.text :message
      t.boolean :seen
      t.boolean :archive

      t.timestamps null: false
    end
  end
end
