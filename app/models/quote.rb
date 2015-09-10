class Quote < ActiveRecord::Base
#validates :status, inclusion: { in: %w(created open clientsubmited adminsent dealerdrafted dealersubmited released) }

validates :name , presence: true
 

  has_many :quote_items  , dependent: :destroy
  has_many :quote_bids , through: :quote_items
  belongs_to :user
  
  
  accepts_nested_attributes_for :quote_bids 
  
  
    
       
  
  
    
   




end