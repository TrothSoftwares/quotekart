class QuoteMailer < ApplicationMailer

def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My QuoteKart')
  end
  
  def send_dealer(dealer, quote)
  @dealer = dealer
  @quote = quote
  mail(to: @dealer.email, subject: 'New Quote From QuoteKart')
  logger.info "##############3 mail send to "<< @dealer.email
  end
  
  
end
