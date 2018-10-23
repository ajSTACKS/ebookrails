Rails.application.routes.draw do
  resources :books
  
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'

  get 'dashboard' => 'pages#dashboard'
	end
  
  root to: 'pages#home'
  
end
