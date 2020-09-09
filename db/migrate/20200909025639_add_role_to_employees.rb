class AddRoleToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :role, :integer
  end
end
