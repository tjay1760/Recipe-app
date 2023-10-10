Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :recipe, only: %i[index show]
  resources :food, only: %i[index new create destroy]
  resources :recipe_food, only: %i[index show]
  resources :public_recipe, only: [:index]
  resources :general_shopping_list, only: [:index]
end
