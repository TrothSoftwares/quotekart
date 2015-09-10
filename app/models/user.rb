class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
          after_create :send_welcome_email 
         
         has_many :quotes
         validates :name , presence: true ,:on => :create
         
         
    
  
  
  
  
private

    def send_welcome_email
      QuoteMailer.welcome_email(self).deliver_later
    end 
end
