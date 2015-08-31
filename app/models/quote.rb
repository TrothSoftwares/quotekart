class Quote < ActiveRecord::Base
validates :status, inclusion: { in: %w(open released) }

  has_many :quote_items
  has_many :quote_bids
  belongs_to :user




end