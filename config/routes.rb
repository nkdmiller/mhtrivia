Rails.application.routes.draw do
  resources :players
  get '/join', to: 'players#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'players#index'
end
