Rails.application.routes.draw do
  root 'home#index'

  resources :cat_entries

  resources :users, :except => [:show]

  resource :sessions, :only => [:new, :create, :destroy]
end
