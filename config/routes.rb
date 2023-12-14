Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :users, only: :show
  resources :reviews

end
