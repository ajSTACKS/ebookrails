Rails.application.routes.draw do
  resources :books
  root to: 'pages#home'
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  post '/buy/:slug', to: 'transactions#create', as: :buy
  get '/pickup/:uuid', to: 'transactions#pickup', as: :pickup  
  get 'dashboard' => 'pages#dashboard'
	end
  

end
