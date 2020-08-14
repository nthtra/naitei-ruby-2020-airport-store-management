class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :company_name
      t.string :identity_number
      t.string :phone_number
      t.string :password_digest
      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at

      t.timestamps
    end
    add_index :users, :email, unique: true 
  end
end
