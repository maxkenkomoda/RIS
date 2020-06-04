Rails.application.routes.draw do
  root 'maps#index'

  resources :maps
  resources :users, only: [:show] do
    member do
      get :likes
      post :like
      post :unlike
    end
  end
#for like unlike

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
end
