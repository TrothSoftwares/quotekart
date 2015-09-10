class RemoveColumnFromQuotebids < ActiveRecord::Migration
  def change
  remove_column :quote_bids, :quote_id, :int
  end
end
