Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :users, only: :show

  resources :reviews do
    resource :helpfuls, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

end
