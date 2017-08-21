Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :event do
    collection do
      post :search
    end
    get :publish, on: :member
    resources :comment
  end
  resources :academic, controller: 'events', type: 'Academic', only: [:index, :show]
  resources :cultural, controller: 'events', type: 'Cultural', only: [:index, :show]
end
