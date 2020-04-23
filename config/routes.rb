Rails.application.routes.draw do
  root to: 'maps#new'

  resources :maps, only: [:index, :new]
  post 'maps/create'
end
