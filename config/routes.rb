Rails.application.routes.draw do
  
  get "/sign_in" => "sessions#sign_in"

  get "/sign_up" => "users#new"
  
  get "/sign_out" => "sessions#destroy"

  post "/veirfy_users" => "sessions#veirfy_user"



  resources :users , only: :create

  resources :chats ,only: [:index]
  
  resources :messages,only: :create

  root "chats#index"

end
