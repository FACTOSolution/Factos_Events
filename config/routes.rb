Rails.application.routes.draw do
  resources :event
  resources :academic, controller: 'events', type: 'Academic'
  resources :cultural, controller: 'events', type: 'Cultural'
end
