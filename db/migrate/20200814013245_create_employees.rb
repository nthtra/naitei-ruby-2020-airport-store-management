class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :employees, :email, unique: true
  end
end
