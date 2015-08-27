class QuoteItem < ActiveRecord::Base
  belongs_to :quote , :class_name => "Quote", :foreign_key => "quote_id"
  has_many :quote_bids  
end
