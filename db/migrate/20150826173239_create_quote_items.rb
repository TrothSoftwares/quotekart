class CreateQuoteItems < ActiveRecord::Migration
  def change
    create_table :quote_items do |t|
      t.belongs_to :quote ,index: true
      t.timestamps null: false
    end
  end
end
