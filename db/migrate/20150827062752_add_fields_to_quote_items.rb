class AddFieldsToQuoteItems < ActiveRecord::Migration
  def change
    add_column :quote_items, :category, :string
    add_column :quote_items, :quote_details, :string
  end
end
