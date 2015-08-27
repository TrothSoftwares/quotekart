class Quote < ActiveRecord::Base
  has_many :quote_items
  has_many :quote_bids, through: :quote_items
  belongs_to :user




end