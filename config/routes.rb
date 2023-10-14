Rails.application.routes.draw do

  devise_for :users
  root 'users#index'

  resources :recipe, only: %i[index show new create destroy] do
    resources :recipe_food, only: %i[new create destroy]
  end
  resources :food, only: %i[index new create destroy]

  resources :public_recipe, only: [:index]
  resources :general_shopping_list, only: [:index]

  resources :recipe do
    member do
      patch :toggle_public
    end
  end

end

