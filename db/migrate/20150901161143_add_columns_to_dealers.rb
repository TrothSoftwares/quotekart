class AddColumnsToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :shopname, :string
    add_column :dealers, :mobile, :string
    add_column :dealers, :phone, :string
    add_column :dealers, :contactemail1, :string
    add_column :dealers, :contactemail2, :string
    add_column :dealers, :type, :text
    add_column :dealers, :address, :text
    add_column :dealers, :district, :string
    add_column :dealers, :state, :string
    add_column :dealers, :pin, :string
  end
end
