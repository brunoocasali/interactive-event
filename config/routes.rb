Rails.application.routes.draw do
  resources :items

  resources :services

  resources :events

  devise_for :users

  # root 'welcome#index'
end
