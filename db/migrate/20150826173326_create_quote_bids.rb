class CreateQuoteBids < ActiveRecord::Migration
  def change
    create_table :quote_bids do |t|
      t.belongs_to :quote , index: true
      t.belongs_to :quote_item ,index:true
      t.belongs_to :dealer , index:true
      t.timestamps null: false
    end
  end
end
