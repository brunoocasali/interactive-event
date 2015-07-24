Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  root 'welcome#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { confirmations: 'confirmations' }

  resources :monitoring, controller: :monitorings, only: :index, param: :hash_tag do
    member do
      delete 'destroy/:item_id', as: :destroy_item, to: 'monitorings#destroy'
      post 'approve/:item_id', as: :approve_item, to: 'monitorings#approve'

      get :approved
      get :candidates
    end
  end

  resources :display, controller: :displays, only: :show, param: :hash_tag

  namespace :admin do
    root 'welcome#index'

    resources :users
    resources :roles, except: :show
    resources :contacts, only: [:create, :index, :new]
  end

  devise_scope :user do
    patch :confirm, to: 'confirmations#confirm'
  end

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  resources :events

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
