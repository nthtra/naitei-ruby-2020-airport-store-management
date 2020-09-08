class RemoveEmailFromEmployees < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :email, :string
  end
end
