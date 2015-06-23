Rails.application.routes.draw do

  get 'items/create'

  devise_for :users

  authenticated :user do
    resources :user, only: [:show]
  end

  root to: 'welcome#index'
  get 'about' => 'welcome#about'

end
