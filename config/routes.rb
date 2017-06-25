Rails.application.routes.draw do
  devise_for :users
  resources :event
  resources :academic, controller: 'events', type: 'Academic'
  resources :cultural, controller: 'events', type: 'Cultural'
end
