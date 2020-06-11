Rails.application.routes.draw do
  root to: 'toppages#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :users, only: [:show] do
    member do
      get :likes
      post :like
      post :unlike
    end
  end

  resources :maps do
    resources :replies, only: [:create, :destroy]
  end

  post 'replies/create'
end
