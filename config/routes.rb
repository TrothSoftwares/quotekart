Rails.application.routes.draw do


  root 'quote#home'
  get 'dashboard/index'
  
  get 'user' => 'user#index'
  get 'dealer' => 'dealer#index'
  get 'admin' => 'admin#index'
  
  devise_for :dealers
  devise_for :admins
  devise_for :users
   
  
 
   
   
end
