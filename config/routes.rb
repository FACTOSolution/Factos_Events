Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :event do
    collection do
      post :search
    end
    get :publish
    resources :comment
  end
  resources :academic, controller: 'event', type: 'Academic', only: [:index, :show]
  resources :cultural, controller: 'event', type: 'Cultural', only: [:index, :show]
  resources :users, only: [:show]
end
