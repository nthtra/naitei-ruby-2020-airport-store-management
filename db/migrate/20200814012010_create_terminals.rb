class CreateTerminals < ActiveRecord::Migration[6.0]
  def change
    create_table :terminals do |t|
      t.string :name
      t.integer :area
      t.text :description

      t.timestamps
    end
    add_index :terminals, :name, unique: true
  end
end
