class QuoteItem < ActiveRecord::Base
  serialize :quote_details, Array
  belongs_to :quote , :class_name => "Quote", :foreign_key => "quote_id"
  has_many :quote_bids  
  
  #before_save :serialize_to_hash
def serialize_to_hash
  self.quote_details = self.quote_details.to_hash
end


end
