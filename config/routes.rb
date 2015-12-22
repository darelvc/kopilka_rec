Rails.application.routes.draw do

  devise_for :chefs
  root "pages#index"
  
  get '/index', to: "pages#index"

  resources :recipes
  
end
