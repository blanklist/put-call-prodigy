Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :contracts, :assets, :users

#Need to add more "excepts" to sessions

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#create"

  root 'welcome#index'

  mount ActionCable.server => '/cable'  
end