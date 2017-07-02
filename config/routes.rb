Rails.application.routes.draw do
  devise_for :users
  resources :event
  resources :academic, controller: 'events', type: 'Academic', only: [:index, :show]
  resources :cultural, controller: 'events', type: 'Cultural', only: [:index, :show]
end
