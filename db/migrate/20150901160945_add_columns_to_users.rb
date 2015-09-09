class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :address, :text
    add_column :users, :district, :string
    add_column :users, :state, :string
    add_column :users, :pin, :string
  end
end
