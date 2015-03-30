Rails.application.routes.draw do
  resources :roles

  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout'}

  get 'welcome/index'

  namespace :admin do
    root 'users#index'
    resources :users
  end

  resources :items, :services, :events
end
