Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :users, only: [:index, :show]

  root "pages#index"
      
  get '/index', to: "pages#index"

  get '/contacts', to: "pages#contact"

  resources :recipes

  resources :posts

  resources :categories, only: [:new, :create, :show]

  # TheComments routes
  concern   :user_comments,  TheComments::UserRoutes.new
  concern   :admin_comments, TheComments::AdminRoutes.new
  resources :comments, concerns:  [:user_comments, :admin_comments]
end
