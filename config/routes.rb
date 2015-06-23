Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    resources :users, only: [:show]
  end

  root to: 'shallows#index'
  get 'about', to: 'shallows#about'

end
