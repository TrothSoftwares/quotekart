class DashboardController < ApplicationController

before_filter :authenticate_user_on_steroids!

 
protected

def authenticate_user_on_steroids!
    unless user_signed_in?
     
        if params[:role_type] == "client"
        redirect_to new_user_session_path
        elsif params[:role_type] == "dealer"
        redirect_to new_dealer_session_path
        elsif params[:role_type] == "admin"
        redirect_to new_admin_session_path
        end
        
        
    end
end
  def index
  end
  
  def client
  end
  def dealer
  end
  def admin
  end
  
  
end
