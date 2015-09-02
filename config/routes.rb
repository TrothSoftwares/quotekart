Rails.application.routes.draw do


  resources :quotes
  root 'quote#home'
  get 'dashboard/index'
  
  get 'user' => 'user#index'
  get 'dealer' => 'dealer#index'
  get 'admin' => 'admin#index'
  
  devise_for :dealers , controllers: { registrations: "dealers/registrations" }
  devise_for :admins
  devise_for :users
   
  
 
   
   
end
