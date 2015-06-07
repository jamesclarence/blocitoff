Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root :to => 'users#show', as: :user_route
  end

  root to: 'welcome#index'
  get 'about' => 'welcome#about'

end
