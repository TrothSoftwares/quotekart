class AddBidAmountToQuoteBids < ActiveRecord::Migration
  def change
    add_column :quote_bids, :bid_amount, :int
  end
end
