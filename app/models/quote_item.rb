class QuoteItem < ActiveRecord::Base
  belongs_to :quote
  has_many :quote_bids
end
