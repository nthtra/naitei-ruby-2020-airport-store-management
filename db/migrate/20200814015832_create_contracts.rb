class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :store, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true, default: Settings.status.pending
      t.datetime :start_date
      t.datetime :end_date
      t.text :deny_message

      t.timestamps
    end
  end
end
