Rails.application.routes.draw do
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Add a route for the "users" page
  get '/users', to: 'users#index', as: 'users'



end

