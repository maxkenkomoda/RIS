Rails.application.routes.draw do
  root to: 'maps#index'

  get 'maps#index'
  get 'maps#new'
end
