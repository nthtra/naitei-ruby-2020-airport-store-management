class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :content, null: true
      t.integer :sender_id
      t.integer :receiver_id
      t.string :sender_type
      t.string :receiver_type
      t.boolean :read , default:false
      t.references :contract, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
