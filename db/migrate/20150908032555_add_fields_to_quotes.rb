class AddFieldsToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :submitted_at, :datetime

  end
end
