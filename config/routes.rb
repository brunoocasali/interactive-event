Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout'},
             controllers: { confirmations: 'confirmations' }

  resources :events, :items, :roles, :services

  scope :profiles do
    get :dashboard, to: 'profiles#dashboard', as: :user_root
  end

  namespace :admin do
    root 'welcome#index'

    resources :users
  end

  devise_scope :user do
    patch :confirm, to: 'confirmations#confirm'
  end

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end
end

