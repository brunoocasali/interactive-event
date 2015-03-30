Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout'}, path: 'd'

  get 'welcome/index'

  resources :items, :services, :events
end
