class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :zip, :string
    add_column :users, :address, :string
    add_column :users, :is_admin, :boolean, default: false, null: false
  end
end
