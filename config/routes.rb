Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    resources :user, only: [:show]
    root to: 'user#show'
  end

  root to: 'welcome#index'
  get 'about' => 'welcome#about'

end
