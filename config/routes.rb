Rails.application.routes.draw do


  root 'quote#home'
  get 'dashboard/index'
  
  get 'client' => 'dashboard#client'
  get 'dealer' => 'dashboard#dealer'
  get 'admin' => 'dashboard#admin'
  
  devise_for :dealers
  devise_for :admins
  devise_for :users
   
  
 
   
   
end
