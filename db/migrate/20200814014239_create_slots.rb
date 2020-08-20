class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.references :terminal, null: false, foreign_key: true
      t.string :name
      t.integer :area
      t.text :description
      t.boolean :is_empty, default: true
      t.float :price

      t.timestamps
    end
    add_index :slots, :name, unique: true
  end
end
