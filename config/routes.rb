Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout'},
             controllers: { registrations: 'registrations',
                            confirmations: 'confirmations' }

  scope '/admin' do
    resources :users do
      patch '/confirm' => 'confirmations#confirm'
    end
  end

  resources :events, :items, :roles, :services
end
