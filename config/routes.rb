Rails.application.routes.draw do

  get 'items/create'

  devise_for :users

  authenticated :user do
    root :to => 'users#show', as: :user_route
    resources :items, only: [:create]
  end

  root to: 'welcome#index'
  get 'about' => 'welcome#about'

end
