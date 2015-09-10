class AddFieldsToQuoteBids < ActiveRecord::Migration
  def change
  add_column :quote_bids, :unit_amount, :decimal
  add_column :quote_bids, :status, :text
  add_column :quote_bids, :remarks, :text
  end
end
