Rails.application.routes.draw do

  get 'items/create'

  devise_for :users

  authenticated :user do
    resources :users, only: [:show]
    resources :items, only: [:create, :destroy]
  end

  root to: 'shallows#index'
  get 'about', to: 'shallows#about'

end
