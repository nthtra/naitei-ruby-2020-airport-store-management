class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.references :slot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :is_active, default:false
      t.string :image_url

      t.timestamps
    end
    add_index :stores, :name
  end
end
