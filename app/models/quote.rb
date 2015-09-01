class Quote < ActiveRecord::Base
validates :status, inclusion: { in: %w(open clientsubmited adminsent dealerdrafted dealersubmited released) }

attr_accessor :status

  has_many :quote_items
  has_many :quote_bids
  belongs_to :user
  
  
    
       
  
  
    
   




end