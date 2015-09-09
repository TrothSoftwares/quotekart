class QuoteItem < ActiveRecord::Base
  serialize :quote_details, Array
  belongs_to :quote 
  has_many :quote_bids  
  
  #before_save :serialize_to_hash


end
