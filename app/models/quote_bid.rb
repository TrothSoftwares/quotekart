class QuoteBid < ActiveRecord::Base
  belongs_to :quote_item
  belongs_to :quote
  belongs_to :dealer
end
