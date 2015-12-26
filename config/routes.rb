Rails.application.routes.draw do

 	devise_for :chefs
  
  resources :chefs, only: [:index, :show]

  root "pages#index"
  
  get '/index', to: "pages#index"

  resources :recipes

  
end
