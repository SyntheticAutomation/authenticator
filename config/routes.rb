Rails.application.routes.draw do

  root 'welcome#index'

  resource :welcome, only: [:index]

  namespace :admin do
    resources :users
  end

  resources :users, only: [:new, :create, :show]

end
