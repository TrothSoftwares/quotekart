class QuoteBid < ActiveRecord::Base
  belongs_to :quote_item   
  belongs_to :dealer  
end
