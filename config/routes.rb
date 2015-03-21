Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  get 'welcome/index'
  resources :items
  resources :services
  resources :events

end
